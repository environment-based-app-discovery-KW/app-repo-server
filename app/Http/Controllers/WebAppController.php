<?php

namespace App\Http\Controllers;

use App\PinnedWebApp;
use App\WebApp;
use App\WebAppDependency;
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
                ->pluck('web_app_dependency_id'))->get(['dependency_name_version as name', 'code_bundle_url']);
        return $webapp;
    }

    public function discover()
    {
        if (env("IS_FULL_MIRROR")) {
            // a full mirror shows only GpsPosition-related apps
            // TODO
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