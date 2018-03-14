//
//  AppDelegate.swift
//  Todoey
//
//  Created by ET on 2018-03-08.
//  Copyright © 2018 ET. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        print(Realm.Configuration.defaultConfiguration.fileURL!)

        do {
            _ = try Realm()
        } catch {
            print("Error initializing new realm, \(error)")
        }

        return true
    }
}

