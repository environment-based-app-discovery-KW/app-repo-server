<?php

namespace App\Http\Controllers;

use App\PinnedWebApp;
use App\WebApp;
use App\WebAppDependency;
use App\WebAppDeploymentLocation;
use App\WebAppHasWebAppDependency;
use App\WebAppVersion;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Input;

/**
 * Created by PhpStorm.
 * User: Kevin
 * Date: 4/13/2018
 * Time: 11:05 PM
 */
class WebAppController extends Controller
{
    public function ls()
    {
        $page = Input::get('page', 0);
        $webapps = WebApp::query()->skip($page * 10)->take(10)->get();
        foreach ($webapps as $webapp) {
            $webapp->latest_version = $webapp->getLatestVersion();
        }
        return $webapps;
    }

    public function download()
    {
        $id = Input::get('id', 0);
        $webapp = WebApp::find($id);
        if (!$webapp) {
            return error('invalid id');
        }
        $app_version = $webapp->getLatestVersion();
        $webapp->deps = WebAppDependency
            ::whereIn('id', WebAppHasWebAppDependency::whereWebAppVersionId($app_version->id)
                ->pluck('web_app_dependency_id'))->get(['dependency_name_version as name', 'code_bundle_hash']);
        $webapp->latestVersion = $app_version;
        return $webapp;
    }

    public function discover()
    {
        if (env("IS_FULL_MIRROR")) {
            // a full mirror shows only GpsPosition-related apps
            $lat = Input::get('lat');
            $lng = Input::get('lng');
            $dep_locs = \DB::select('
            SELECT
                *, @distance_in_m AS distance_in_m from web_app_deployment_locations
            WHERE
                (
                    @distance_in_m := (
                        111111 * DEGREES(
                            ACOS(
                                COS(
                                    RADIANS(
                                        web_app_deployment_locations.latitude
                                    )
                                ) * COS(RADIANS(?)) * COS(
                                    RADIANS(
                                        web_app_deployment_locations.longitude - ?
                                    )
                                ) + SIN(
                                    RADIANS(
                                        web_app_deployment_locations.latitude
                                    )
                                ) * SIN(RADIANS(?))
                            )
                        )
                    )
                ) <= radius_m order by @distance_in_m asc;
            ', [$lat, $lng, $lat]);
            //TODO: short-circuit where
            $apps = WebApp::whereIn('id', collect($dep_locs)->pluck('web_app_id'))->get();
            foreach ($apps as $app) {
                $app->latest_version = $app->getLatestVersion();
            }
            return $apps;
        } else {
            // a partial in-NAT mirror shows only pinned apps
            $pinned_apps = PinnedWebApp::leftJoin('web_apps', 'web_apps.id', '=', 'web_app_id')->orderBy('pinned_web_apps.priority', 'desc')->get(['web_apps.*']);
            foreach ($pinned_apps as $webapp) {
                $webapp->latest_version = WebApp::getLatestVersionForWebApp($webapp->id);
            }
            return $pinned_apps;
        }
    }
}