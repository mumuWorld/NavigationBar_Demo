//
//  AppDelegate.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/9/11.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let baseVC = LMRootViewController()
        let navi = LMBaseNavigationViewController.init(rootViewController: baseVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
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

func printLog<T>(message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
    // 1.获取文件名,包含后缀名
    let name = (file as NSString).lastPathComponent
    // 1.1 切割文件名和后缀名
    let fileArray = name.components(separatedBy: ".")
    // 1.2 获取文件名
    let fileName = fileArray[0]
    // 2.打印内容
    print("[\(fileName) \(funcName)](\(lineNum)): \(message)")
    #endif
}
