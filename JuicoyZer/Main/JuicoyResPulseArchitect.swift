//
//  JuicoyResPulseArchitect.swift
//  JuicoyZer
//
//  Created by  on 2026/1/4.
//

import UIKit
import CryptoKit
import Foundation
import AVFoundation

// MARK: -  解密架构核心 (Decryption Architect)
class JuicoyResPulseArchitect {
    
    // 使用你新生成的 64 位密钥
    private static let JuicoySecurityHexKey = "A3D2F1B0E9C8D7A6F5B4E3D2C1B0A9F8E7D6C5B4A3F2E1D0B9A8C7E6F5D4B3A2"
    private static let JuicoyNonceSize = 16
    private static let JuicoyTagSize = 16

    private static var JuicoyCipherKey: SymmetricKey? = {
        let cleanStr = JuicoySecurityHexKey.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let JuicoyKeyData = Data(hexString: cleanStr), JuicoyKeyData.count == 32 else {
            return nil
        }
        return SymmetricKey(data: JuicoyKeyData)
    }()

    // MARK: - 针对 poledance0.mp4.enc 格式的媒体解密
    /// - Parameter fullName: 传入带原始后缀的文件名，例如 "poledance0.mp4"
    static func JuicoyExtractMediaStream(fullIdentifier fullName: String) -> URL? {
        // 1. 核心解密逻辑
        guard let decryptedData = JuicoyProcessCoreDecryption(resourceName: fullName) else {
            return nil
        }
        
        // 2. 自动处理后缀名
        // 如果传入 "poledance0.mp4"，提取出 "mp4" 作为临时文件的后缀
        let fileExtension = (fullName as NSString).pathExtension
        let safeExtension = fileExtension.isEmpty ? "mp4" : fileExtension
        
        let JuicoyTempFileName = "temp_\(UUID().uuidString).\(safeExtension)"
        let JuicoyTempURL = FileManager.default.temporaryDirectory.appendingPathComponent(JuicoyTempFileName)
        
        do {
            try decryptedData.write(to: JuicoyTempURL)
            return JuicoyTempURL
        } catch {
            return nil
        }
    }

    private static func JuicoyProcessCoreDecryption(resourceName: String) -> Data? {
        guard let JuicoyKey = JuicoyCipherKey else { return nil }
        
        // 注意：这里 resourceName 是 "poledance0.mp4"，withExtension 是 "enc"
        guard let JuicoyUrl = Bundle.main.url(forResource: resourceName, withExtension: "enc"),
              let JuicoyFullData = try? Data(contentsOf: JuicoyUrl) else {
            return nil
        }
        
        let JuicoyNonceData = JuicoyFullData.prefix(JuicoyNonceSize)
        let JuicoyTagStartIndex = JuicoyFullData.count - JuicoyTagSize
        guard JuicoyTagStartIndex >= JuicoyNonceSize else { return nil }
        
        let JuicoyCiphertext = JuicoyFullData.subdata(in: JuicoyNonceSize..<JuicoyTagStartIndex)
        let JuicoyTag = JuicoyFullData.suffix(JuicoyTagSize)
        
        do {
            let JuicoyBoxNonce = try AES.GCM.Nonce(data: JuicoyNonceData)
            let JuicoySealedBox = try AES.GCM.SealedBox(nonce: JuicoyBoxNonce, ciphertext: JuicoyCiphertext, tag: JuicoyTag)
            return try AES.GCM.open(JuicoySealedBox, using: JuicoyKey)
        } catch {
            return nil
        }
    }
}

extension JuicoyResPulseArchitect {
    
    /// 从加密的 .enc 文件中还原图片，并自动识别 @2x 或 @3x 比例
    /// - Parameter fullName: 传入不带 .enc 的全名，例如 "poledance0@3x.png"
    static func JuicoyExtractVisualPulse(fullIdentifier fullName: String) -> UIImage? {
        // 1. 调用核心解密获取原始 Data
        guard let JuicoyDecryptedData = JuicoyProcessCoreDecryption(resourceName: fullName) else {
            return nil
        }
        
        // 2. 自动判断 Scale (倍率)
        var JuicoyDisplayScale: CGFloat = 1.0
        if fullName.contains("@3x") {
            JuicoyDisplayScale = 3.0
        } else if fullName.contains("@2x") {
            JuicoyDisplayScale = 2.0
        }
        
        // 3. 将 Data 转换为指定倍率的 UIImage
        // 这样可以确保 poledance0@3x.png 在不同机型上显示尺寸正确
        if let JuicoyImg = UIImage(data: JuicoyDecryptedData, scale: JuicoyDisplayScale) {
            return JuicoyImg
        }
        
        return nil
    }
}
extension Data {
    // 修复 Hex String -> Data 的逻辑
    init?(hexString: String) {
        let len = hexString.count
        guard len % 2 == 0 else { return nil }
        var data = Data(capacity: len / 2)
        var i = hexString.startIndex
        
        while i < hexString.endIndex {
            let j = hexString.index(i, offsetBy: 2)
            let bytes = hexString[i..<j]
            // 将每两个字符转换为一个 UInt8 数字
            if let num = UInt8(bytes, radix: 16) {
                data.append(num) // 修复此处：直接添加 num
            } else {
                return nil
            }
            i = j
        }
        self = data
    }
}


//MAEK: ---使用
//guard let JuicoyURL = JuicoyResPulseArchitect.JuicoyExtractMediaStream(fullIdentifier: juicoyModel.JuicoyMediaUrl + ".mp4") else {
//    print("解密失败，请检查密钥或资源文件是否存在")
//    return }
