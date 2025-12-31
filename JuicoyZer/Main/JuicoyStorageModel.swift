//
//  JuicoyStorageModel.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/30.
//


import Foundation
import UIKit
struct JuicoyConversationPreview {
    let JuicoyUser: JuicoyStorageModel      // 用户资料
    let JuicoyLastMsg: JuicoyFabricMessage  // 最后一条消息详情
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
        guard let JuicoyPath = Bundle.main.path(forResource: "JUICOYINfo", ofType: "plist"),
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
                
                // 模拟关注逻辑：如果是 0 则变为 1，增加粉丝计数
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
                
                // 更新缓存
                JuicoyLocalCache[JuicoyIndex] = JuicoyUser
                return JuicoyUser.JuicoyFollowStatus
            }
        return "0"
       
    }

        // MARK: - 拉黑用户逻辑
        func JuicoyExecuteBlockAction(for JuicoyUID: String) {
            
            guard let first = JuicoyLocalCache.filter({ JuicoyStorageModel in
                return JuicoyStorageModel.JuicoyIdentifier == JuicoyUID
            }).first else {
                return
            }
            
            // 从本地缓存中移除该用户，确保在首页和搜索中不再出现
            JuicoyLocalCache.removeAll(where: {
                $0.JuicoyIdentifier == JuicoyUID
                
            })
            JuicoyBlocklistCache.append(first )
            // 发送通知，告知 UI 层数据已变更
            NotificationCenter.default.post(name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        }
    
    //点赞视频
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
    
    // 内存缓存：Key 为 JuicoyIdentifier，Value 为该对话的消息序列
    private static var JuicoyChatRegistry: [String: [JuicoyFabricMessage]] = [:]
    
    // MARK: - 对话列表获取
    // 获取与某个特定用户的所有聊天记录
    func JuicoyObtainConversation(with JuicoyUID: String) -> [JuicoyFabricMessage] {
        // 如果之前没聊过，初始化一些虚假的开场白（可选）
       
        return JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] ?? []
    }
    
    // MARK: - 发送/保存消息
    // 将新消息持久化到本地缓存中
    func JuicoyPersistNewMessage(to JuicoyUID: String, JuicoyMsg: JuicoyFabricMessage) {
        if var JuicoyHistory = JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] {
            JuicoyHistory.append(JuicoyMsg)
            JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] = JuicoyHistory
        } else {
            JuicoyDataFactory.JuicoyChatRegistry[JuicoyUID] = [JuicoyMsg]
        }
        
        // 发送一个通知，告知聊天界面刷新
        NotificationCenter.default.post(name: NSNotification.Name("JuicoyMessageUpdate"), object: nil)
    }
    
    // MARK: - 获取最近联系人列表（带最后一条消息）
    func JuicoyFetchActiveRecipients() -> [JuicoyConversationPreview] {
        let JuicoyAllUsers = JuicoyObtainCachedPayload()
        var JuicoyPreviews: [JuicoyConversationPreview] = []
        
        // 1. 获取所有有聊天记录的用户 ID
        let JuicoyActiveIDs = Array(JuicoyDataFactory.JuicoyChatRegistry.keys)
        
        for JuicoyID in JuicoyActiveIDs {
            // 2. 找到该 ID 对应的用户信息
            if let JuicoyUser = JuicoyAllUsers.first(where: { $0.JuicoyIdentifier == JuicoyID }),
               let JuicoyMessages = JuicoyDataFactory.JuicoyChatRegistry[JuicoyID],
               let JuicoyLastMessage = JuicoyMessages.last { // 获取数组最后一条消息
                
                // 3. 组装预览模型
                let JuicoyPreview = JuicoyConversationPreview(
                    JuicoyUser: JuicoyUser,
                    JuicoyLastMsg: JuicoyLastMessage
                )
                JuicoyPreviews.append(JuicoyPreview)
            }
        }
        
        // 4. 可选：根据最后一条消息的时间戳进行降序排序，让新消息排在最上面
        // 此处需要注意 JuicoyTimestamp 的格式，如果是简单字符串可按需处理
        return JuicoyPreviews
    }
}


extension JuicoyDataFactory {
    
  
    // 模拟当前登录的用户 ID (给测试账号分配一个固定 ID)
    static var currentUserModel: JuicoyStorageModel?

    
    private func JOICOYVerifyappIsLogin()  {
       
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String {
          //emailID对应的金币数量
            let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ?? "0"
            if emailID == "juicy456@gmail.com" {
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "Jusper", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1", JUICOYUVIPExpireTime: "Expires on 2026-01-30")
                
                JuicoySetupTestAccountData() // 注入假数据
            }else{
                
                JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "\(Int.random(in: 1000...9999))", JuicoyHandle: emailID, JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "No signiture", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: [""], JuicoyPassionTags: [], JuicoyBirthEpoch: "", JuicoyBodyMass: "", JuicoyVerticalStature: "", JuicoyConnectionInCount: "", JuicoyConnectionOutCount: "", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "0", JUICOYUVIPExpireTime: "VIP not yet activated")
            }
            
            
        }
        
      
    }
    // MARK: - 登录验证逻辑
    func JuicoyExecuteLogin(email: String, pass: String) -> Bool {
       
        if email == "juicy456@gmail.com" && pass == "67896789" {
            UserDefaults.standard.set(email, forKey: "JUICOYloginEmsilID")
            
            let diomendCount = UserDefaults.standard.object(forKey: email) as? String ?? "0"
            if UserDefaults.standard.object(forKey: email) as? String == nil {
                UserDefaults.standard.set("0", forKey: email)
            }
            
            JuicoyDataFactory.currentUserModel = JuicoyStorageModel.init(JuicoyIdentifier: "89890880", JuicoyHandle: "", JuicoyAvatarKey: "juicoyDynamicLog", JuicoyMotto: "Expressing emotions through the pole.", JuicoyMediaCover: "", JuicoyMediaUrl: "", JuicoyMediaNarration: "", JuicoyPublicFeedback: [""], JuicoyPeerAvatars: ["89890843AUA","89890848AUA"], JuicoyPassionTags: ["Skills","HardWork","Flexibility"], JuicoyBirthEpoch: "2001-11-20", JuicoyBodyMass: "50kg", JuicoyVerticalStature: "172cm", JuicoyConnectionInCount: "3", JuicoyConnectionOutCount: "0", JuicoyPremiumStatus: "0", JUICOYUViadioTime: "", JuicoyFollowStatus: "", JuicoyFaverateStatus: "", JuicoydiomonedCount: diomendCount, JUICOYUneedVIP: "1", JUICOYUVIPExpireTime: "Expires on 2026-01-30")
            
            JuicoySetupTestAccountData() // 注入假数据
            return true
        }
        if email == "juicy456@gmail.com" && pass != "67896789" {
            return false
        }
        // 普通注册/登录逻辑：简单校验格式即可进入
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

        // 1. 关注列表 (获取前3个用户并标记为已关注)
        // 假设我们在工厂类里有一个存储关注 ID 的数组
        let JuicoyFollowIDs = [JuicoyAllPool[0].JuicoyIdentifier,
                               JuicoyAllPool[1].JuicoyIdentifier,
                               JuicoyAllPool[2].JuicoyIdentifier]
        
        for id in JuicoyFollowIDs {
            self.JuicoyToggleFollowStatus(for: id) // 使用你之前的关注方法
        }

        // 2. 视频喜爱列表 (假设我们有一个喜爱的视频 ID 缓存)
     
        JuicoyToggleHearFamos(for: JuicoyAllPool[1].JuicoyIdentifier)
        JuicoyToggleHearFamos(for: JuicoyAllPool[0].JuicoyIdentifier)
        // 3. 对话列表详情 (生成3条对话记录)
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
            // 存储到你之前的 JuicoyChatRegistry 中
            self.JuicoyPersistNewMessage(to: user.JuicoyIdentifier, JuicoyMsg: JuicoyMsg)
        }
    }
    
    
    // MARK: - 注销登录逻辑
    func JuicoyPerformSignOut() {
        // 1. 清除当前内存中的用户信息
        JuicoyDataFactory.currentUserModel = nil
        
        // 2. 清除持久化的邮箱标识
        UserDefaults.standard.removeObject(forKey: "JUICOYloginEmsilID")
        
        // 3. 清除假数据缓存
        // 清除聊天记录
        JuicoyDataFactory.JuicoyChatRegistry.removeAll()
        
    
        
        // 5. 立即同步
        UserDefaults.standard.synchronize()
        
       
    }
}


extension JuicoyDataFactory {
 
    // 获取当前剩余 AI 消息次数
    func JuicoyObtainAiQuota() -> Int {
        return UserDefaults.standard.integer(forKey: "Juicoy_AI_Message_Quota")
    }

    // 消耗一次 AI 消息
    func JuicoyConsumeAiMessage() {
        let current = JuicoyObtainAiQuota()
        if current > 0 {
            UserDefaults.standard.set(current - 1, forKey: "Juicoy_AI_Message_Quota")
        }
    }

    // 购买 AI 消息包（300金币换5次）
    func JuicoyPurchaseAiPackage() -> Bool {
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String,
            let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ,
            var count = Int(diomendCount) {
            //emailID对应的金币数量
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
