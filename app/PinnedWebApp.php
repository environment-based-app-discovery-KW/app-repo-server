<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\PinnedWebApp
 *
 * @property int $id
 * @property int $web_app_id
 * @property int $priority
 * @property \Carbon\Carbon|null $created_at
 * @property \Carbon\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp wherePriority($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereWebAppId($value)
 * @mixin \Eloquent
 * @property string $launch_params_json
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereLaunchParamsJson($value)
 * @property string $display_name
 * @method static \Illuminate\Database\Eloquent\Builder|\App\PinnedWebApp whereDisplayName($value)
 */
class PinnedWebApp extends Model
{
    //
}
