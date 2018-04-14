<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Input;

/**
 * Created by PhpStorm.
 * User: Kevin
 * Date: 4/13/2018
 * Time: 11:05 PM
 */
class FileController extends Controller
{
    public function download()
    {
        $hash = str_replace('.', '', Input::get('hash'));
        $fpath = join_paths(env('FILE_BUCKET_PATH'), $hash);
        if (!file_exists($fpath)) {
            abort(404);
            return;
        }
        return response()->download($fpath);
    }
}