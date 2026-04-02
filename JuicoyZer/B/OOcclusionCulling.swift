//
//  OOcclusionCulling.swift
//  JuicoyZer
//
//  Created by mumu on 2026/4/2.
//

import UIKit

class OOcclusionCulling: NSObject {

}
import Foundation
import UIKit

//app B包全局配置
public class APPPREFIX_SDKConfig: NSObject {
    
    // MARK: - 1. 单例
    public static let shared = APPPREFIX_SDKConfig()
    
    // 私有初始化方法，强制使用单例
    internal override init() {
        super.init()
    }
    
    // MARK: - 2. 环境控制与 Window
    
    /**
     * @brief 是否是测试环境。设置为 true 时，只读属性 (baseURL, aesKey, appId, aesIV) 将使用 Debug 配置。
     */
    public var APPPREFIX_debugMode: Bool = false
    
   
    
    // MARK: - 3. 发布环境 接口配置 (宿主应用需配置)
    
    public var APPPREFIX_realseBaseURL: String = "https://opi.azj2wkck.link"//base url ****
    public var APPPREFIX_realseAPPID: String = "26650432"//APPID ****
    public var APPPREFIX_realseAesKey: String = "v6pj2p7yz4qwngul"//AES加密key ****
    public var APPPREFIX_realseAesIV: String = "gd60kr6orlmaenol"//AES加密IV ****
    
    // MARK: - 4. A/B 切换和 Adjust 配置
    
    /**
     * @brief 启动页网络请求时间控制（Unix Time Interval）。早于此时间，LaunchController 将直接进入 A 面。
     */
    public var APPPREFIX_launchRequestTimeInterval: TimeInterval = 0 //****
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.adid 并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var APPPREFIX_adjustId: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "APPAdjustId")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "APPAdjustId") as? String
        }
    }
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.JsonResponse并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var APPPREFIX_adjustJsonResponse: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "adjustJsonResponse")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "adjustJsonResponse") as? String
        }
    }
    
    // MARK: - FB Adjust 配置 (宿主应用需配置)
    public var APPPREFIX_adjustAppToken: String = "8j8uv8kgm2o0" // AppToken ***
    public var APPPREFIX_adjustEventToken: String = "klgrfa" // EventToken ***
    public var APPPREFIX_adjustPurchaseToken: String = "rocd67" // PurchaseToken ***
    
    // MARK: - 5. UI 配置 (宿主应用需配置)
    
    public var APPPREFIX_LaunchBackgroundImage: String = "JUICOYLaunch"//启动页面背景图 ****
    public var APPPREFIX_mainBackgroundImage: String = "searchHeuristic"//登录和web页面背景图 ****
    public var APPPREFIX_loginButtonBackImage: String = "sortingComplexity1" //登录按钮背景 ****
    public var APPPREFIX_smallImage: String = "futurePromise2" //登录页如果有小图 ****
    
    public var APPPREFIX_logButtonWidth: CGFloat = 345//登录按钮宽 ****
    public var APPPREFIX_logButtonHeight: CGFloat = 50//登录按钮高 ****
    public var APPPREFIX_logButtonTextColor: UIColor = .clear//登录按钮字体颜色 ****
    public var APPPREFIX_smallImageWidth: CGFloat = 134//登录页面 小图片 宽
    public var APPPREFIX_smallImageHeight: CGFloat = 49//登录页面 小图片 高
    
    // MARK: - 6. API 路径配置 (宿主应用需配置)
    
    public var APPPREFIX_launchDetailPath: String = "/opi/v1/linkedListo"//启动接口 ****
    public var APPPREFIX_loginPath: String = "/opi/v1/binaryTreel"//登录 ****
    
    public var APPPREFIX_verifyReciptyPath: String = "/opi/v1/graphTraversalp"//验单 ****
    
    // MARK: - 7. API 参数 Key 配置 (宿主应用需配置)
    
    public var APPPREFIX_launchParamaKey: APPPREFIX_LaunchParamaKey = APPPREFIX_LaunchParamaKey(
        APPPREFIX_timeZone: "depthFirstSearcht",//时区 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_textInput: "breadthFirstSearchk",//键盘 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_localeLaunguge: "loadBalancinge",//语言 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_ajresult: "proxyServera",//fb的包。需要在请求开关接口的时候，上传adjust归因参数：
        
        APPPREFIX_ifDebug: "parityBitg",//是否调试 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_ADID: "dictionaryCodingi",//adid  FB必须有
        APPPREFIX_Reason: "huffmanCodinga"//Ajresult  FB必须有
    )
    
    public var APPPREFIX_loginParamaKey: APPPREFIX_LoginParamaKey = APPPREFIX_LoginParamaKey(
        APPPREFIX_deviceID: "arithmeticCodingn",//deviceIDkey ****
        APPPREFIX_adjustID: "coreAnimationa",//adjustIDkey ****
        APPPREFIX_passwordKey: "coreImaged"//passwordkey ****
    )
    
   
    
    public var APPPREFIX_verifyReciptyParamaKey: APPPREFIX_VerifyReciptyParamaKey = APPPREFIX_VerifyReciptyParamaKey(
        APPPREFIX_payload: "avFoundationp",//payloadkey ****
        APPPREFIX_transactionId: "swiftuiStandardt",//transactionIdkey ****
        APPPREFIX_callbackResult: "memoryLeakc"//callbackResultkey ****
    )
    
   
    
    public var APPPREFIX_purchaseParama: [String: String] = ["ufuwfgqyvfhjedpp": "$x0o.o9e9".JoicoydeMercrypt(),
                                                             "vxdnqayrfkiwdfuq": "$m1s.s9e9".JoicoydeMercrypt(),
                                                             "axefjiudlafkiwedbg": "$g3v.s9i9".JoicoydeMercrypt(),
                                                             "oqeenftfqycnkqjs": "$k4x.g9p9".JoicoydeMercrypt(),
                                                             "gmnaqtvemcnrczkc": "$h9s.w9v9".JoicoydeMercrypt(),
                                                             "ieinuciqaconusjt": "$c1z9z.p9u9".JoicoydeMercrypt(),
                                                             "rqinasqejfmgmaiu": "$c4r9x.c9p9".JoicoydeMercrypt(),
                                                             "ljpebwvnxyqpwhbl": "$s9e9t.p9b9".JoicoydeMercrypt()]
    
    // MARK: - 10. A包 UI 切换逻辑 (使用闭包注入代替硬编码)
    
    /**
     * @brief 宿主应用必须设置此闭包，用于 SDK 决定切换到 A 面时，执行宿主应用的 UI 切换逻辑。
     * @discussion 宿主应用的 AppDelegate 必须将切换逻辑注入到此 Handler 中。
     * @param window 宿主应用的 UIWindow。
     */
    public var APPPREFIX_setting_App_A_Root_Handler: ((UIWindow?) -> Void)?
    
    /**
     * @brief 内部调用方法，触发宿主应用配置的 A 包切换逻辑。
     * @discussion SDK 内部调用此方法来执行 A 包切换。
     */
    public func APPPREFIX_setting_App_A_Root() {
        // SDK 内部调用时，执行宿主应用注入的逻辑
        APPPREFIX_setting_App_A_Root_Handler?(APPPREFIX_AppLaunchController.APPPREFIX_mainWindow)
    }
    
    // MARK: - 11. 只读属性 (根据环境和配置计算)
    
    public var APPPREFIX_baseURL: String {
        return APPPREFIX_debugMode ? "https://opi.cphub.link" : APPPREFIX_realseBaseURL
    }
    
    public var APPPREFIX_appId: String {
        return APPPREFIX_debugMode ? "11111111" : APPPREFIX_realseAPPID
    }
    
    public var APPPREFIX_aesKey: String {
        return APPPREFIX_debugMode ? "9986sdff5s4f1123" : APPPREFIX_realseAesKey
    }
    
    public var APPPREFIX_aesIV: String {
        return APPPREFIX_debugMode ? "9986sdff5s4y456a" : APPPREFIX_realseAesIV
    }
}
