//
//  JuicoyStorageModel.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/30.
//


import Foundation

struct JuicoyStorageModel: Codable {
    let JuicoyIdentifier: String
    let JuicoyHandle: String
    let JuicoyAvatarKey: String
    let JuicoyMotto: String

    let JuicoyMediaCover: String
    let JuicoyMediaUrl: String
    let JuicoyMediaNarration: String
    let JuicoyPublicFeedback: [String]
    let JuicoyPeerAvatars: [String]
    let JuicoyPassionTags: [String]
    let JuicoyBirthEpoch: String
    let JuicoyBodyMass: String
    let JuicoyVerticalStature: String
    let JuicoyConnectionInCount: String
    var JuicoyConnectionOutCount: String
    let JuicoyPremiumStatus: String
    let JUICOYUViadioTime:String
    var JuicoyFollowStatus: String
    var JuicoyFaverateStatus: String
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
    }
}

class JuicoyDataFactory {
    
    static let JuicoySharedInstance = JuicoyDataFactory()
    private var JuicoyLocalCache: [JuicoyStorageModel] = []
    
    private var JuicoyBlocklistCache: [JuicoyStorageModel] = []

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
                JuicoyPremiumStatus: JuicoyDict["JUICOYUVINfofolloweisvip"] ?? "0", JUICOYUViadioTime:JuicoyDict["JUICOYUViadioTime"] ?? "00:00", JuicoyFollowStatus: "0", JuicoyFaverateStatus: "0"
            )
        }
    }

    func JuicoyObtainCachedPayload() -> [JuicoyStorageModel] {
        return JuicoyLocalCache
    }
    
    
    func JuicoyObtainCachedFaverateVideo() -> [JuicoyStorageModel] {
        return JuicoyLocalCache.filter { JuicoyStorageModel in
            JuicoyStorageModel.JuicoyFaverateStatus == "1"
        }
    }
    
    
    func JuicoyObtainCachedFollowingsVideo() -> [JuicoyStorageModel] {
        return JuicoyLocalCache.filter { JuicoyStorageModel in
            JuicoyStorageModel.JuicoyFollowStatus == "1"
        }
    }
    
    func JuicoyObtainCachedBlocksUser() -> [JuicoyStorageModel] {
        return self.JuicoyBlocklistCache
    }
    
    func JuicoyToggleFollowStatus(for JuicoyUID: String) {
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
            }
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
