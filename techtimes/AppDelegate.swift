//
//  AppDelegate.swift
//  techtimes
//
//  Created by Neo Ighodaro on 26/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import UIKit
import PushNotifications
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    let pushNotifications = PushNotifications.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.pushNotifications.start(instanceId: "d16b67d2-5b75-4a57-8bec-967a5c13da9d")
        self.pushNotifications.registerForRemoteNotifications()
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.pushNotifications.registerDeviceToken(deviceToken)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        Deeplinker.checkDeepLink()
    }
    
    // MARK: - Handle Push Notifications

    func userNotificationCenter(_ center: UNUserNotificationCenter,  willPresent notification: UNNotification, withCompletionHandler   completionHandler: @escaping (_ options:   UNNotificationPresentationOptions) -> Void) {
        Deeplinker.handleRemoteNotification(notification.request.content.userInfo)
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        Deeplinker.handleRemoteNotification(response.notification.request.content.userInfo)
        completionHandler()
    }
}

