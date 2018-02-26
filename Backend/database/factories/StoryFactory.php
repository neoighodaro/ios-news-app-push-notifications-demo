<?php

use Faker\Generator as Faker;

$factory->define(App\Story::class, function (Faker $faker) {
    return [
        'category_id' => rand(1, 5),
        'title' => $faker->sentence,
        'notification' => $faker->sentence,
        'content' => $faker->paragraphs(10, true),
        'featured_image' => 'https://placehold.it/1000x500',
    ];
});
