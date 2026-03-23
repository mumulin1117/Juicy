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
    var JUICOYUVIPExpireTime:String
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
        case JUICOYUVIPExpireTime = "JUICOYUVIPExpireTime"
    }
}

class JuicoyDataFactory {
    
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
                JUICOYUneedVIP: JuicoyDict["JUICOYUneedVIP"] ?? "0",
                JUICOYUVIPExpireTime:JuicoyDict["JUICOYUVIPExpireTime"] ?? "VIP not yet activated"
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
            if emailID == "juicy456@gmail.com" {
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "Jusper", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1", JUICOYUVIPExpireTime: "Expires on 2026-01-30")
                
                JuicoySetupTestAccountData()
            }else{
                
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 1000...9999))", JuicoyHandle: emailID, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "No signiture", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0", JUICOYUVIPExpireTime: "VIP not yet activated")
            }
            
            
        }
        
      
    }

    func JuicoyExecuteLogin(email: String, pass: String) -> Bool {
       
        if email == "juicy456@gmail.com" && pass == "67896789" {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1", JUICOYUVIPExpireTime: "Expires on 2026-01-30")
            
            JuicoySetupTestAccountData()
            return true
        }
        if email == "juicy456@gmail.com" && pass != "67896789" {
            return false
        }
        
        if email.contains("@") && pass.count >= 6 {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 1000...9999))", JuicoyHandle: email, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: "", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0", JUICOYUVIPExpireTime: "VIP not yet activated")
            
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
