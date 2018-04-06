<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWebAppDeploymentLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('web_app_deployment_locations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('web_app_id');
            $table->double('latitude');
            $table->double('longitude');
            $table->double('radius_m');
            $table->longText('launch_params_json');
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
        Schema::dropIfExists('web_app_deployment_locations');
    }
}
