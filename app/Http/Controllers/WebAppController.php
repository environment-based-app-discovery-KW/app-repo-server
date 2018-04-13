<?php

namespace App\Http\Controllers;

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
        return $webapps;
    }

    public function download()
    {
        $id = Input::get('id', 0);
        $webapp = WebApp::find($id);
        if (!$webapp) {
            return error('invalid id');
        }
        $app_version = WebAppVersion::whereWebAppId($webapp->id)->orderBy('id', 'desc')->first();
        $webapp->deps = WebAppDependency
            ::whereIn('id', WebAppHasWebAppDependency::whereWebAppVersionId($app_version->id)
                ->pluck('web_app_dependency_id'))->get(['dependency_name_version as name', 'code_bundle_url']);
        return $webapp;
    }
}