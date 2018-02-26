<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StoryCategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('story_categories')->insert([
            [
                'title' => 'Breaking News',
                'interest' => 'breaking_news',
                'created_at' => new DateTime,
            ],
            [
                'title' => 'Sports',
                'interest' => 'sports',
                'created_at' => new DateTime,
            ],
            [
                'title' => 'Politics',
                'interest' => 'politics',
                'created_at' => new DateTime,
            ],
            [
                'title' => 'Business',
                'interest' => 'business',
                'created_at' => new DateTime,
            ],
            [
                'title' => 'Culture',
                'interest' => 'culture',
                'created_at' => new DateTime,
            ],
        ]);
    }
}
