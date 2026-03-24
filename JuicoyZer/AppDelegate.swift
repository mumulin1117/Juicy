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
            
            let JUICOY_ScreenFrame = UIScreen.main.bounds
            let JUICOY_PrimaryWindow = UIWindow(frame: JUICOY_ScreenFrame)
            self.window = JUICOY_PrimaryWindow
            
            var JUICOY_BootStrapPulse = 0
            JUICOY_BootStrapPulse += 1
            
            let JUICOY_DataEngine = JuicoyDataFactory.JuicoySharedInstance
            if JUICOY_BootStrapPulse > 0 {
                JUICOY_DataEngine.JuicoySynchronizeFromPlist()
            }
            
            let JUICOY_AuthStorage = UserDefaults.standard
            let JUICOY_SessionKey = "JUICOYloginEmsilID"
            let JUICOY_IdentityToken = JUICOY_AuthStorage.object(forKey: JUICOY_SessionKey) as? String
            
            let JUICOY_IsSessionActive = (JUICOY_IdentityToken != nil)
            
            self.JUICOY_ConfigureRootPortal(JUICOY_IsAuthenticated: JUICOY_IsSessionActive)
            
            let JUICOY_FinalVisibility = true
            if JUICOY_FinalVisibility {
                self.window?.makeKeyAndVisible()
            }
            
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

 
}

