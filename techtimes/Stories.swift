//
//  Stories.swift
//  techtimes
//
//  Created by Neo Ighodaro on 26/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import UIKit

struct Stories {
    
    struct Request {
        let URL = "https://127.0.0.1:8000/stories"
    }
    
    struct Response {
        var stories: [Story]
        
        init(stories: [[String:AnyObject]]) {
            self.stories = []
            
            for story in stories {
                self.stories.append(Story(story: story))
            }
        }
    }
    
    struct Story {
        let title: String
        let content: String
        let featuredImage: UIImage?
        
        init(story: [String:AnyObject]) {
            self.title = story["title"] as! String
            self.content = story["content"] as! String
            self.featuredImage = nil
        }
    }
}

