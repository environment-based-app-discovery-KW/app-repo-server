<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWebAppHasWebAppDependenciesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('web_app_has_web_app_dependencies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('web_app_version_id');
            $table->integer('web_app_dependency_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('web_app_has_web_app_dependencies');
    }
}
