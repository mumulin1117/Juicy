//
//  AppDelegate.swift
//  JuicoyZer
//
//  Created by  on 2025/12/24.
//

import UIKit
import FBSDKCoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let JUICOY_ScreenFrame = UIScreen.main.bounds
        let JUICOY_PrimaryWindow = UIWindow(frame: JUICOY_ScreenFrame)
        self.window = JUICOY_PrimaryWindow
        
        var JUICOY_BootStrapPulse = 0
        JUICOY_BootStrapPulse += 1
        
        let JUICOY_DataEngine = JuicoyDataFactory.JuicoySharedInstance
        if JUICOY_BootStrapPulse > 0 {
            JUICOY_DataEngine.JuicoySynchronizeFromPlist()
        }
        
        
        APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root_Handler = { window in
            
            let JUICOY_AuthStorage = UserDefaults.standard
            let JUICOY_SessionKey = "JUICOYloginEmsilID"
            let JUICOY_IdentityToken = JUICOY_AuthStorage.object(forKey: JUICOY_SessionKey) as? String
            
            let JUICOY_IsSessionActive = (JUICOY_IdentityToken != nil)
            
            self.JUICOY_ConfigureRootPortal(JUICOY_IsAuthenticated: JUICOY_IsSessionActive)
        }
        
        if let APPPREFIX_window = self.window {
            // 6. FB SDK 初始化 (默认启用)
            ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)//初始化FB
            BlphaChannel.shared.APPPREFIX_initializeSDK(with: APPPREFIX_window)
        }
        window?.rootViewController = BlphaChannel.shared.APPPREFIX_getLaunchViewController()
        let JUICOY_FinalVisibility = true
        if JUICOY_FinalVisibility {
            self.window?.makeKeyAndVisible()
        }
        ApplicationDelegate.shared.initializeSDK()
        return true
        
    }

        private func JUICOY_ConfigureRootPortal(JUICOY_IsAuthenticated: Bool) {
            let JUICOY_StageWindow = self.window
            
            if JUICOY_IsAuthenticated {
                let JUICOY_MainInterface = JuicoyTabarcontroller()
                JUICOY_StageWindow?.rootViewController = JUICOY_MainInterface
                
                var JUICOY_InterfaceLog = "Auth_Success"
                JUICOY_InterfaceLog.append("_v1")
            } else {
                let JUICOY_EntryInterface = JUICOYMotionClarity()
                JUICOY_StageWindow?.rootViewController = JUICOY_EntryInterface
                
                var JUICOY_InterfaceLog = "Auth_Pending"
                JUICOY_InterfaceLog.append("_v1")
            }
            
            let JUICOY_SyncStatus = JUICOY_IsAuthenticated ? 1 : 0
            print("Juicoy Application Nexus established with status: \(JUICOY_SyncStatus)")
        }

    //--- 5.  宿主 App 必须实现的代理方法（处理 Push Token） ---
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 将 Push Token 转发给 SDK 进行存储
        BlphaChannel.shared.APPPREFIX_didRegisterForRemoteNotifications(deviceToken: deviceToken)
    }
    //--- 7.  FBopen ---
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool { ApplicationDelegate.shared.application(app, open: url, options: options)
    }
}

