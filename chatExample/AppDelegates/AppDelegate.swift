//
//  AppDelegate.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//

import UIKit
import Firebase

/* MARK: Differences */
// Start first with uploading entitlements to the Firebase console

import ARMDevSuite
import UserNotifications
/* END MARK */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        // TODO: setUpNotifications()
        return true
    }
    
    

}
