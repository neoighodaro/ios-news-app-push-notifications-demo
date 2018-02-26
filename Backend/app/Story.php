<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Pusher\PushNotifications\PushNotifications;

class Story extends Model
{
    protected $with = ['category'];

    protected $fillable = ['category_id', 'title', 'notification', 'content', 'featured_image'];

    public function push(): array
    {
        if (!$this->exists or $this->notification == null) {
            return [];
        }

        $pushNotifications = new PushNotifications([
            'instanceId' => env('PUSHER_PN_INSTANCE_ID'),
            'secretKey' => env('PUSHER_PN_SECRET_KEY'),
        ]);

        $publishResponse = (array) $pushNotifications->publish(
            [$this->category->interest],
            [
                'apns' => [
                    'aps' => [
                        'alert' => [
                            'title' => "📖 TechTimes: {$this->title}",
                            'body' => (string) $this->notification,
                        ],
                    ],
                ],
            ]
        );

        return $publishResponse;
    }

    public function category()
    {
        return $this->belongsTo(StoryCategory::class);
    }
}
