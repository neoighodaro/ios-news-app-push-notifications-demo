//
//  Deeplink.swift
//  techtimes
//
//  Created by Neo Ighodaro on 27/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import UIKit

// Credit: https://medium.com/@stasost/ios-how-to-open-deep-links-notifications-and-shortcuts-253fb38e1696

enum DeeplinkType {
    case story(story: Stories.Story)
}

let Deeplinker = DeepLinkManager()

class DeepLinkManager {
    fileprivate init() {}
    
    private var deeplinkType: DeeplinkType?
    
    func checkDeepLink() {
        guard let deeplinkType = self.deeplinkType else {
            return
        }
        
        DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)

        self.deeplinkType = nil
    }
    
    func handleRemoteNotification(_ notification: [AnyHashable: Any]) {
        self.deeplinkType = NotificationParser.shared.handleNotification(notification)
    }
}

class DeeplinkNavigator {
    static let shared = DeeplinkNavigator()

    private init() {}
    
    func proceedToDeeplink(_ type: DeeplinkType) {
        switch type {
        case .story(story: let story):
            if let rootVc = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "StoryViewController") as? StoryViewController {
                    vc.story = story
                    rootVc.show(vc, sender: rootVc)
                }
            }
        }
    }
}
