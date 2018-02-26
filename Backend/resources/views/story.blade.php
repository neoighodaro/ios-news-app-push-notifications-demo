<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create new post</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style type="text/css">
    .invalid-feedback { width: 100%; margin-top: .25rem; font-size: 80%; color: #dc3545; }
    </style>
</head>
<body style="margin-top: 120px;">
    <nav class="navbar navbar-inverse bg-inverse fixed-top">
        <a class="navbar-brand" href="#" style="font-weight: bold">TECHTIMES</a>
    </nav>

    <div class="container">
        @if (Session::has('message'))
        <div class="alert alert-success" role="alert">{{ session('message') }}</div>
        @endif
        <div class="starter-template">
            <form action="/stories/create" method="POST">
                {{ csrf_field() }}
                <div class="form-group">
                    <label for="post-title">Post Title</label>
                    <input name="title" type="text" class="form-control" id="post-title" placeholder="Enter Post Title">
                    @if ($errors->has('title'))
                    <div class="invalid-feedback">{{ $errors->first('title') }}</div>
                    @endif
                </div>
                <div class="form-group">
                    <label for="post-category">Category</label>
                    <select name="category_id" id="post-category" class="form-control">
                        <option value="">Select A Category</option>
                        @foreach (App\StoryCategory::all() as $category)
                        <option value="{{ $category->id}}">{{ $category->title }}</option>
                        @endforeach
                    </select>
                    @if ($errors->has('category_id'))
                    <div class="invalid-feedback">{{ $errors->first('category_id') }}</div>
                    @endif
                </div>
                <div class="form-group">
                    <label for="post-content">Post Content</label>
                    <textarea name="content" id="post-content" cols="30" rows="10" placeholder="Enter your post content" class="form-control"></textarea>
                    @if ($errors->has('content'))
                    <div class="invalid-feedback">{{ $errors->first('content') }}</div>
                    @endif
                </div>
                <div class="form-group">
                    <label for="post-notification">Push Notification</label>
                    <input name="notification" type="text" class="form-control" id="post-notification" placeholder="Enter Push Notification Message">
                    @if ($errors->has('notiifcation'))
                    <div class="invalid-feedback">{{ $errors->first('notiifcation') }}</div>
                    @else
                    <small class="form-text text-muted">Leave this blank if you do not want to publish a push notification for this post.</small>
                    @endif
                </div>
                <button type="submit" class="btn btn-primary">Save Post</button>
            </form>
        </div>
    </div>

</body>
</html>
