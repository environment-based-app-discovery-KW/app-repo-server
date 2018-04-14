<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => 'app'], function () {
    Route::any('ls', 'WebAppController@ls');
    Route::any('discover', 'WebAppController@discover');
    Route::any('download', 'WebAppController@download');
});

Route::group(['prefix' => 'sync'], function () {
    Route::any('/', 'SyncController@index');
});