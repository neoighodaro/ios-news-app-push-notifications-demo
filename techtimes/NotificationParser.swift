//
//  NotificationParser.swift
//  techtimes
//
//  Created by Neo Ighodaro on 27/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import Foundation

class NotificationParser {
    static let shared = NotificationParser()

    private init() { }
    
    func handleNotification(_ userInfo: [AnyHashable : Any]) -> DeeplinkType? {
        if let data = userInfo["data"] as? [String: AnyObject] {
            return .story(story: Stories.Story(story: data))
        }
        
        return nil
    }
}
