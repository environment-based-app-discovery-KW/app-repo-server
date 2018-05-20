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

## Docker 部署方法
```
docker build -t app_repo_server_image .
docker run -p 0.0.0.0:888:888 --name app_repo_server_container -t app_repo_server_image
```
