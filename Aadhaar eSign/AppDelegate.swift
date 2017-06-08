//
//  AppDelegate.swift
//  Aadhaar eSign
//
//  Created by Balamurali Pandranki on 30/03/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var newWindow = UIWindow(frame: UIScreen.main.bounds)
        self.window = newWindow
        window?.rootViewController = setTabBar()
        
       // FIRApp.configure()
        FIRCrashMessage("Crash button pressed")
        //fatalError()
        return true
    }

    func setTabBar()-> UITabBarController{
        
        let tabBarController = UITabBarController()
        
        let home = HomeViewController()
        let documents = DocumentsViewController()
        let inbox = InboxViewController()
        let profile = ProfileViewController()
        
        let navDocuments = UINavigationController(rootViewController: documents)
        let navInbox = UINavigationController(rootViewController: inbox)
        let navProfile = UINavigationController(rootViewController: profile)
        
        tabBarController.viewControllers = [home, navDocuments, navInbox, navProfile]

        let tabbar = tabBarController.tabBar
        //tabBar
        tabbar.barTintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
        let attributes = [NSFontAttributeName:UIFont(name: "CircularStd-Medium", size: 13)!,NSForegroundColorAttributeName:UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1)]
        let attributes1 = [NSFontAttributeName:UIFont(name: "CircularStd-Medium", size: 13)!,NSForegroundColorAttributeName:UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)]
        
        UITabBar.appearance().tintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes1, for: .selected)
        
        let tabHome = tabbar.items![0]
        tabHome.title = "Home" // tabbar title
        tabHome.image = UIImage(named: "house.png")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabHome.selectedImage = UIImage(named: "house.png") // select image
        tabHome.titlePositionAdjustment.vertical = tabHome.titlePositionAdjustment.vertical-4 // title position change
        
        let tabDoc = tabbar.items![1]
        tabDoc.title = "Documents" // tabbar title
        tabDoc.image = UIImage(named: "write.png")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabDoc.selectedImage = UIImage(named: "write.png") // select image
        tabDoc.titlePositionAdjustment.vertical = tabDoc.titlePositionAdjustment.vertical-4 // title position change

        let tabInbox = tabbar.items![2]
        tabInbox.title = "Inbox"
        tabInbox.image = UIImage(named: "letter.png")?.withRenderingMode(.alwaysOriginal)
        tabInbox.selectedImage = UIImage(named: "letter.png")
        tabInbox.titlePositionAdjustment.vertical = tabInbox.titlePositionAdjustment.vertical - 4
        
        let tabProfile = tabbar.items![3]
        tabProfile.title = "Profile"
        tabProfile.image = UIImage(named: "user.png")?.withRenderingMode(.alwaysOriginal)
        tabProfile.selectedImage = UIImage(named: "user.png")
        tabProfile.titlePositionAdjustment.vertical = tabProfile.titlePositionAdjustment.vertical - 4
        
        return tabBarController
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

