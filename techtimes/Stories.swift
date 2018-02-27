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
        let URL = "https://ac51eaa0.ngrok.io/stories"
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
        let id: Int
        let title: String
        let content: String
        let created_at: String
        let featuredImage: UIImage?
        
        init(story: [String:AnyObject]) {
            self.id = story["id"] as! Int
            self.title = story["title"] as! String
            self.content = story["content"] as! String
            self.created_at = story["created_at"] as! String
            self.featuredImage = nil
        }
    }
}

