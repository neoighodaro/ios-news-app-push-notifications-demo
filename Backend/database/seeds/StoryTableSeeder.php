<?php

use Illuminate\Database\Seeder;
use App\Story;

class StoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Story::class, 100)->create();
    }
}
