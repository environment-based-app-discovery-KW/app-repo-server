# app-repo-server

APP仓库服务器，分布式多地部署（可在NAT内部署），存储与管理app代码、元数据、部署信息

## 路由

```php
Route::group(['prefix' => 'app'], function () {
    Route::any('ls', 'WebAppController@ls');
    Route::any('discover', 'WebAppController@discover');
    Route::any('lan-discover', 'WebAppController@lanDiscover');
    Route::any('download', 'WebAppController@download');
});

Route::group(['prefix' => 'sync'], function () {
    Route::any('/', 'SyncController@index');
});

Route::group(['prefix' => 'file'], function () {
    Route::any('/download', 'FileController@download');
});
```

