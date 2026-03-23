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

class JuicoyResPulseArchitect {
    
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

   
    static func JuicoyExtractMediaStream(fullIdentifier fullName: String) -> URL? {
       
        guard let decryptedData = JuicoyProcessCoreDecryption(resourceName: fullName) else {
            return nil
        }
       
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
    
    static func JuicoyExtractVisualPulse(fullIdentifier fullName: String) -> UIImage? {
       
        guard let JuicoyDecryptedData = JuicoyProcessCoreDecryption(resourceName: fullName + "@3x.png") else {
            return nil
        }
     
        let JuicoyDisplayScale: CGFloat = 3.0

        if let JuicoyImg = UIImage(data: JuicoyDecryptedData, scale: JuicoyDisplayScale) {
            return JuicoyImg
        }
        
        return nil
    }
}
extension Data {
   
    init?(hexString: String) {
        let len = hexString.count
        guard len % 2 == 0 else { return nil }
        var data = Data(capacity: len / 2)
        var i = hexString.startIndex
        
        while i < hexString.endIndex {
            let j = hexString.index(i, offsetBy: 2)
            let bytes = hexString[i..<j]
            
            if let num = UInt8(bytes, radix: 16) {
                data.append(num)
            } else {
                return nil
            }
            i = j
        }
        self = data
    }
}

