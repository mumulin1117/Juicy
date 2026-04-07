//
//  JuicoyStorageModel.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/30.
//


import Foundation
import UIKit
struct JuicoyConversationPreview {
    let JuicoyUser: JuicoyStorageModel     
    let JuicoyLastMsg: JuicoyFabricMessage
}
struct JuicoyStorageModel: Codable {
    let JuicoyIdentifier: String
    var JuicoyHandle: String
    var JuicoyAvatarKey: String
    var JuicoyMotto: String

    let JuicoyMediaCover: String
    let JuicoyMediaUrl: String
    let JuicoyMediaNarration: String
    let JuicoyPublicFeedback: [String]
    let JuicoyPeerAvatars: [String]
    var JuicoyPassionTags: [String]
    var JuicoyBirthEpoch: String
    var JuicoyBodyMass: String
    var JuicoyVerticalStature: String
    var JuicoyConnectionInCount: String
    var JuicoyConnectionOutCount: String
    var JuicoyPremiumStatus: String
    let JUICOYUViadioTime:String
    var JuicoyFollowStatus: String
    var JuicoyFaverateStatus: String
    var JuicoydiomonedCount: String
    var JUICOYUneedVIP:String
//    var JUICOYUVIPExpireTime:Date?
    enum CodingKeys: String, CodingKey {
        case JuicoyIdentifier = "JUICOYUID"
        case JuicoyHandle = "JUICOYUName"
        case JuicoyAvatarKey = "JUICOYUphoto"
        case JuicoyMotto = "JUICOYUsignture"
 
        case JuicoyMediaCover = "JUICOYUViadioPic"
        case JuicoyMediaUrl = "JUICOYUViadioPath"
        case JuicoyMediaNarration = "JUICOYUViadioDescrib"
        case JuicoyPublicFeedback = "JUICOYUViadioComment"
        case JuicoyPeerAvatars = "JUICOYUVFriendsPics"
        case JuicoyPassionTags = "JUICOYUVInterests"
        case JuicoyBirthEpoch = "JUICOYUVINfoBirth"
        case JuicoyBodyMass = "JUICOYUVINfoWeight"
        case JuicoyVerticalStature = "JUICOYUVINfoHeight"
        case JuicoyConnectionInCount = "JUICOYUVINfofollowintcount"
        case JuicoyConnectionOutCount = "JUICOYUVINfofollowerscount"
        case JuicoyPremiumStatus = "JUICOYUVINfofolloweisvip"
        case JUICOYUViadioTime = "JUICOYUViadioTime"
        case JuicoyFollowStatus = "JuicoyFollowStatus"
        case JuicoyFaverateStatus = "JuicoyFaverateStatus"
        case JuicoydiomonedCount = "JuicoydiomonedCount"
        case JUICOYUneedVIP = "JUICOYUneedVIP"
       
    }
}

class JuicoyDataFactory {
    //VIP管理
    private let JuicoyVipStatusKey = "JUICOY_USER_VIP_ACTIVE"
    private let JuicoyVipExpiryKey = "JUICOY_USER_VIP_EXPIRY_DATE"
    
    
    static let JuicoySharedInstance = JuicoyDataFactory()
    private var JuicoyLocalCache: [JuicoyStorageModel] = []
    
    private var JuicoyBlocklistCache: [JuicoyStorageModel] = []
    static var Juicoyuserphtho:UIImage?
    static var JuicoyuserBackground:[UIImage]?
    func JuicoySynchronizeFromPlist() {
        guard let JuicoyPath = Bundle.main.path(forResource: "JUICOYINfo", ofType: "pqlzijszt".JoicoydeMercrypt()),
              let JuicoyRawData = NSArray(contentsOfFile: JuicoyPath) as? [[String: String]] else {
            return
        }

        self.JuicoyLocalCache = JuicoyRawData.map { JuicoyDict in
            
            let JuicoyFeedbackArray = JuicoyDict["JUICOYUViadioComment"]?.components(separatedBy: "%%%") ?? []
            let JuicoyPeers = JuicoyDict["JUICOYUVFriendsPics"]?.components(separatedBy: "%%%") ?? []
            let JuicoyTags = JuicoyDict["JUICOYUVInterests"]?.components(separatedBy: "%%%") ?? []
           
            
            return JuicoyStorageModel(
                JuicoyIdentifier: JuicoyDict["JUICOYUID"] ?? "",
                JuicoyHandle: JuicoyDict["JUICOYUName"] ?? "",
                JuicoyAvatarKey: JuicoyDict["JUICOYUphoto"] ?? "",
                JuicoyMotto: JuicoyDict["JUICOYUsignture"] ?? "",
               
                JuicoyMediaCover: JuicoyDict["JUICOYUViadioPic"] ?? "",
                JuicoyMediaUrl: JuicoyDict["JUICOYUViadioPath"] ?? "",
                JuicoyMediaNarration: JuicoyDict["JUICOYUViadioDescrib"] ?? "",
                JuicoyPublicFeedback: JuicoyFeedbackArray,
                JuicoyPeerAvatars: JuicoyPeers,
            
                JuicoyPassionTags: JuicoyTags,
                JuicoyBirthEpoch: JuicoyDict["JUICOYUVINfoBirth"] ?? "",
                JuicoyBodyMass: JuicoyDict["JUICOYUVINfoWeight"] ?? "",
                JuicoyVerticalStature: JuicoyDict["JUICOYUVINfoHeight"] ?? "",
                JuicoyConnectionInCount: JuicoyDict["JUICOYUVINfofollowintcount"] ?? "0",
                JuicoyConnectionOutCount: JuicoyDict["JUICOYUVINfofollowerscount"] ?? "0",
                JuicoyPremiumStatus: JuicoyDict["JUICOYUVINfofolloweisvip"] ?? "0", 
                JUICOYUViadioTime:JuicoyDict["JUICOYUViadioTime"] ?? "00:00",
                JuicoyFollowStatus:JuicoyDict["JuicoyFollowStatus"] ?? "0",
                JuicoyFaverateStatus: JuicoyDict["JuicoyFaverateStatus"] ?? "0",
                JuicoydiomonedCount: JuicoyDict["JuicoydiomonedCount"] ?? "0",
                JUICOYUneedVIP: JuicoyDict["JUICOYUneedVIP"] ?? "0"
//                ,
//                JUICOYUVIPExpireTime:JuicoyDict["JUICOYUVIPExpireTime"] //?? "VIP not yet activated"
            )
        }
        
        JOICOYVerifyappIsLogin()
    }

    func JuicoyObtainCachedPayload() -> [JuicoyStorageModel] {
        return JuicoyLocalCache
    }
    
    
    func JuicoyObtainCachedFaverateVideo() -> [JuicoyStorageModel] {
        return JuicoyLocalCache.filter { JuicoyStorageModel in
            JuicoyStorageModel.JuicoyFaverateStatus == "1"
        }
    }
    
    
    func JuicoyObtainCachedFollowingsUser() -> [JuicoyStorageModel] {
        return JuicoyLocalCache.filter { JuicoyStorageModel in
            JuicoyStorageModel.JuicoyFollowStatus == "1"
        }
    }
    
    func JuicoyObtainCachedBlocksUser() -> [JuicoyStorageModel] {
        return self.JuicoyBlocklistCache
    }
    
    func JuicoyToggleFollowStatus(for JuicoyUID: String)->String {
            if let JuicoyIndex = JuicoyLocalCache.firstIndex(where: { $0.JuicoyIdentifier == JuicoyUID }) {
                var JuicoyUser = JuicoyLocalCache[JuicoyIndex]
                
                if JuicoyUser.JuicoyFollowStatus == "0" {
                    JuicoyUser.JuicoyFollowStatus = "1"
                    if let JuicoyCurrentCount = Int(JuicoyUser.JuicoyConnectionOutCount) {
                        JuicoyUser.JuicoyConnectionOutCount = "\(JuicoyCurrentCount + 1)"
                    }
                } else {
                    JuicoyUser.JuicoyFollowStatus = "0"
                    if let JuicoyCurrentCount = Int(JuicoyUser.JuicoyConnectionOutCount), JuicoyCurrentCount > 0 {
                        JuicoyUser.JuicoyConnectionOutCount = "\(JuicoyCurrentCount - 1)"
                    }
                }
              
                JuicoyLocalCache[JuicoyIndex] = JuicoyUser
                return JuicoyUser.JuicoyFollowStatus
            }
        return "0"
       
    }

        func JuicoyExecuteBlockAction(for JuicoyUID: String) {
            
            guard let first = JuicoyLocalCache.filter({ JuicoyStorageModel in
                return JuicoyStorageModel.JuicoyIdentifier == JuicoyUID
            }).first else {
                return
            }
           
            JuicoyLocalCache.removeAll(where: {
                $0.JuicoyIdentifier == JuicoyUID
                
            })
            JuicoyBlocklistCache.append(first )
          
            NotificationCenter.default.post(name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        }
    
    
    func JuicoyToggleHearFamos(for JuicoyUID: String) {
            if let JuicoyIndex = JuicoyLocalCache.firstIndex(where: { $0.JuicoyIdentifier == JuicoyUID }) {
                var JuicoyUser = JuicoyLocalCache[JuicoyIndex]
               
                if JuicoyUser.JuicoyFaverateStatus == "0" {
                    JuicoyUser.JuicoyFaverateStatus = "1"
                    
                } else {
                    JuicoyUser.JuicoyFaverateStatus = "0"
                   
                }
                
               
                JuicoyLocalCache[JuicoyIndex] = JuicoyUser
            }
        }
}


extension JuicoyDataFactory {
    
    private static var JuicoyChatRegistry: [String: [JuicoyFabricMessage]] = [:]
    
    func JuicoyObtainConversation(with JuicoyUID: String) -> [JuicoyFabricMessage] {
      
        return JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] ?? []
    }
    

    func JuicoyPersistNewMessage(to JuicoyUID: String, JuicoyMsg: JuicoyFabricMessage) {
        if var JuicoyHistory = JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] {
            JuicoyHistory.append(JuicoyMsg)
            JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] = JuicoyHistory
        } else {
            JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] = [JuicoyMsg]
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("JuicoyMessageUpdate"), object: nil)
    }
    
    
    func JuicoyFetchActiveRecipients() -> [JuicoyConversationPreview] {
        let JuicoyAllUsers = JuicoyObtainCachedPayload()
        var JuicoyPreviews: [JuicoyConversationPreview] = []
        
       
        let JuicoyActiveIDs = Array(JuicoyDataFactory.JuicoyChatRegistry.keys)
        
        for JuicoyID in JuicoyActiveIDs {
         
            if let JuicoyUser = JuicoyAllUsers.first(where: { $0.JuicoyIdentifier == JuicoyID }),
               let JuicoyMessages = JuicoyDataFactory.JuicoyChatRegistry[JuicoyID],
               let JuicoyLastMessage = JuicoyMessages.last {
                
                let JuicoyPreview = JuicoyConversationPreview(
                    JuicoyUser: JuicoyUser,
                    JuicoyLastMsg: JuicoyLastMessage
                )
                JuicoyPreviews.append(JuicoyPreview)
            }
        }
     
        return JuicoyPreviews
    }
}


extension JuicoyDataFactory {
    
  
    static var currentUserModel: JuicoyStorageModel?

    
    private func JOICOYVerifyappIsLogin()  {
       
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String {
         
            let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ?? "0"
            
            let (isVip, expiryString) = JuicoyLoadVipProfileFromLocal()
            
            if emailID == "juicy456@gmail.com" {
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "Jusper", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: isVip ? "1" : "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1")
              
                JuicoySetupTestAccountData()
            }else{
                
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 1000...9999))", JuicoyHandle: emailID, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "No signiture", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: isVip ? "1" : "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0")
            }
            
            
        }
        
      
    }

    func JuicoyExecuteLogin(email: String, pass: String,isappleLogin:Bool = false) -> Bool {
       
        if email == "juicy456@gmail.com" && pass == "67896789" {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1")
            
            JuicoySetupTestAccountData()
            return true
        }
        if email == "juicy456@gmail.com" && pass != "67896789" {
            return false
        }
        
        if isappleLogin {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 9999...99999))", JuicoyHandle: email, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: "", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0")
            
            return true
        }
        if email.contains("@") && pass.count >= 6 {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 1000...9999))", JuicoyHandle: email, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: "", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0")
            
            return true
        }
        return false
    }
    
    private func JuicoySetupTestAccountData() {
        let JuicoyAllPool = JuicoyObtainCachedPayload()
        guard JuicoyAllPool.count >= 5 else { return }

        let JuicoyFollowIDs = [JuicoyAllPool[0].JuicoyIdentifier,
                               JuicoyAllPool[1].JuicoyIdentifier,
                               JuicoyAllPool[2].JuicoyIdentifier]
        
        for id in JuicoyFollowIDs {
            self.JuicoyToggleFollowStatus(for: id) // 使用你之前的关注方法
        }

     
        JuicoyToggleHearFamos(for: JuicoyAllPool[1].JuicoyIdentifier)
        JuicoyToggleHearFamos(for: JuicoyAllPool[0].JuicoyIdentifier)
        
        let JuicoyChatUsers = [JuicoyAllPool[0], JuicoyAllPool[1], JuicoyAllPool[2]]
        let JuicoyFakeTexts = [
            "Your new routine is fire! 🔥",
            "How long did it take to master that spin?",
            "Hey! Are you going to the studio tomorrow?"
        ]

        for (index, user) in JuicoyChatUsers.enumerated() {
            let JuicoyMsg = JuicoyFabricMessage(
                JuicoyContent: JuicoyFakeTexts[index],
                JuicoyIsLead: false, // 对方发来的
                JuicoyTimestamp: "\(index + 1) hour ago"
            )
            
            self.JuicoyPersistNewMessage(to: user.JuicoyIdentifier, JuicoyMsg: JuicoyMsg)
        }
    }
    
   
    func JuicoyPerformSignOut() {
      
        JuicoyDataFactory.currentUserModel = nil
        
        UserDefaults.standard.removeObject(forKey: "JUICOYloginEmsilID")
        UserDefaults.standard.removeObject(forKey: JuicoyVipStatusKey)   // 清理 VIP 状态
            UserDefaults.standard.removeObject(forKey: JuicoyVipExpiryKey)
        JuicoyDataFactory.JuicoyChatRegistry.removeAll()
        
        UserDefaults.standard.synchronize()
        
       
    }
}


extension JuicoyDataFactory {
 
    func JuicoyObtainAiQuota() -> Int {
        return UserDefaults.standard.integer(forKey: "Juicoy_AI_Message_Quota")
    }

    func JuicoyConsumeAiMessage() {
        let current = JuicoyObtainAiQuota()
        if current > 0 {
            UserDefaults.standard.set(current - 1, forKey: "Juicoy_AI_Message_Quota")
        }
    }

    func JuicoyPurchaseAiPackage() -> Bool {
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String,
            let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ,
            var count = Int(diomendCount) {
          
            if count >= 300 {
                count -= 300
                UserDefaults.standard.set("\(count)", forKey: emailID)
                
                let currentQuota = JuicoyObtainAiQuota()
                UserDefaults.standard.set(currentQuota + 5, forKey: "Juicoy_AI_Message_Quota")
                return true
            }else{
                return false
            }
            
        }
        return false
    }
    
    func JuicoyPurchaseRemebershio(JuicoySelectedTierIndex:Int) -> Bool {
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String,
            let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ,
            var count = Int(diomendCount) {
            //emailID对应的金币数量
            var nnedCount = 1499
            if JuicoySelectedTierIndex == 0 {
                nnedCount = 699
            }
            
            if JuicoySelectedTierIndex == 1 {
                nnedCount = 1499
            }
            
            if JuicoySelectedTierIndex == 2 {
                nnedCount = 4599
            }
            
            if count >= nnedCount {
                count -= nnedCount
                UserDefaults.standard.set("\(count)", forKey: emailID)
               
                return true
            }else{
                return false
            }
            
        }
        return false
    }
}


extension JuicoyDataFactory {
    
    // 执行 VIP 购买并更新本地存储 (Purchase & Update)
    func JuicoyUpgradeUserArtistryVip(with tier: Int) -> Bool {
        // 先检查金币是否足够 (调用你现有的扣款逻辑)
        let purchaseSuccess = self.JuicoyPurchaseRemebershio(JuicoySelectedTierIndex: tier)
        
        guard purchaseSuccess else { return false }
        
        // 计算新的到期时间
        let calendar = Calendar.current
        let (isCurrentlyVip, currentExpiry) = JuicoyLoadVipProfileFromLocal()
        
        // 如果当前是 VIP，在原到期日后累加；如果不是，从现在开始计算
        let baseDate = (isCurrentlyVip && currentExpiry != nil) ? currentExpiry! : Date()
        
        var dateComponents = DateComponents()
        switch tier {
        case 0: dateComponents.day = 7    // 周卡
        case 1: dateComponents.month = 1  // 月卡
        case 2: dateComponents.month = 12 // 年卡 (假设索引2是年卡)
        default: dateComponents.month = 1
        }
        
        if let newExpiryDate = calendar.date(byAdding: dateComponents, to: baseDate) {
            // 同步到本地
            JuicoyPersistVipToLocal(status: true, expiry: newExpiryDate)
            
            // 同步到内存模型
            JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus = "1"
            return true
        }
        
        return false
    }

    // 持久化存储 (Save)
    private func JuicoyPersistVipToLocal(status: Bool, expiry: Date) {
        UserDefaults.standard.set(status, forKey: JuicoyVipStatusKey)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: expiry)
        UserDefaults.standard.set(dateString, forKey: JuicoyVipExpiryKey)
        UserDefaults.standard.synchronize()
    }

    // 从本地加载并校验 (Load & Verify)
    func JuicoyLoadVipProfileFromLocal() -> (isActive: Bool, expiry: Date?) {
        let isStoredVip = UserDefaults.standard.bool(forKey: JuicoyVipStatusKey)
        guard let dateString = UserDefaults.standard.string(forKey: JuicoyVipExpiryKey) else {
            return (false, nil)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let expiryDate = formatter.date(from: dateString) {
            // 自动检查：如果当前时间超过到期时间，则 VIP 失效
            if expiryDate < Date() {
                return (false, expiryDate)
            }
            return (isStoredVip, expiryDate)
        }
        return (false, nil)
    }
    
    func JuicoyObtainVipStatusNarrative() -> String {
        let (JuicoyIsActive, JuicoyExpiryDate) = self.JuicoyLoadVipProfileFromLocal()
        
        if JuicoyIsActive, let JuicoyDate = JuicoyExpiryDate {
            let JuicoyFormatter = DateFormatter()
            // 使用标准的 年-月-日 格式
            JuicoyFormatter.dateFormat = "yyyy-MM-dd"
            let JuicoyDateString = JuicoyFormatter.string(from: JuicoyDate)
            
            // 如果是VIP，显示到期时间
            return "Expiry Date: \(JuicoyDateString)"
        } else {
            // 如果不是VIP，显示提示语
            return "You are not a VIP yet"
        }
        
    }
    
    
    
}

extension JuicoyDataFactory {
    
    func JuicoyProcessPurchaseAction(at JuicoyIndex: Int) -> Bool {
        // 调用你现有的扣币逻辑
        let JuicoySuccess = self.JuicoyPurchaseRemebershio(JuicoySelectedTierIndex: JuicoyIndex)
        
        guard JuicoySuccess else { return false }
        
        let JuicoyCalendar = Calendar.current
        let (JuicoyActive, JuicoyCurrentExpiry) = self.JuicoyLoadVipProfileFromLocal()
        let JuicoyBaseDate = (JuicoyActive && JuicoyCurrentExpiry != nil) ? JuicoyCurrentExpiry! : Date()
        
        var JuicoyNewExpiry: Date?
        
        switch JuicoyIndex {
        case 0: // Weekly - 7 Days
            JuicoyNewExpiry = JuicoyCalendar.date(byAdding: .day, value: 7, to: JuicoyBaseDate)
        case 1: // Yearly - 1 Year
            JuicoyNewExpiry = JuicoyCalendar.date(byAdding: .year, value: 1, to: JuicoyBaseDate)
        case 2: // Lifetime - Set to year 2099
            var JuicoyComp = DateComponents()
            JuicoyComp.year = 2099
            JuicoyComp.month = 1
            JuicoyComp.day = 1
            JuicoyNewExpiry = JuicoyCalendar.date(from: JuicoyComp)
        default:
            break
        }
        
        if let JuicoyFinalDate = JuicoyNewExpiry {
            // 保存到本地同步
            self.JuicoyPersistVipToLocal(status: true, expiry: JuicoyFinalDate)
            // 同步内存模型状态
            JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus = "1"
            return true
        }
        
        return false
    }
}
