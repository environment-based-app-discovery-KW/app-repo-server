<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWebAppDependenciesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('web_app_dependencies', function (Blueprint $table) {
            $table->increments('id');
            $table->text('dependency_name');
            $table->text('dependency_version');
            $table->text('dependency_name_version');
            $table->text('code_bundle_url');
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
        Schema::dropIfExists('web_app_dependencies');
    }
}
