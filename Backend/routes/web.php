<?php

use App\Story;
use Illuminate\Http\Request;

Route::view('/stories/create', 'story');

Route::post('/stories/create', function (Request $request) {
    $data = $request->validate([
        'title' => 'required|string',
        'content' => 'required|string',
        'notification' => 'nullable|string',
        'category_id' => 'required|exists:story_categories,id',
    ]);

    $story = Story::create($data);
    $story->push();

    return back()->withMessage('Post Added Successfully.');
});

Route::get('/stories/{id}', function (int $id) {
    return Story::findOrFail($id);
});

Route::get('/stories', function () {
    return Story::orderBy('id', 'desc')->paginate(20);
});

Route::view('/', 'welcome');
