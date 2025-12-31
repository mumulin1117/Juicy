//
//  AppDelegate.swift
//  JuicoyZer
//
//  Created by  on 2025/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        JuicoyDataFactory.JuicoySharedInstance.JuicoySynchronizeFromPlist()
        if ( UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String ) != nil {
            self.window?.rootViewController = JuicoyTabarcontroller()
        }else{
            window?.rootViewController = JUICOYMotionClarity()
           
        }
        self.window?.makeKeyAndVisible()
        return true
    }

 
}

