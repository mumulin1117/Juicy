//
//  JUICYSubscriptionManager.swift
//  JuicoyZer
//
//  Created by  on 2026/3/24.
//

import Foundation

enum JUICYVipPassType {
    case week
    case month
}

struct JUICYUserSession {
    var JUICYIsPremiumActive: Bool
    var JUICYVipExpiryDate: Date?
}

class JUICYSubscriptionManager {
    
    static let shared = JUICYSubscriptionManager()
    
    func JUICYCalculateNewExpiry(for JUICYUser: JUICYUserSession, adding JUICYPass: JUICYVipPassType) -> Date {
        let JUICYCurrentCalendar = Calendar.current
        
        // Determination of the starting line for the movement extension
        // If already a member, start from the expiry date; otherwise, start from now.
        let JUICYReferenceBaseDate: Date
        if JUICYUser.JUICYIsPremiumActive, let JUICYExistingExpiry = JUICYUser.JUICYVipExpiryDate {
            JUICYReferenceBaseDate = JUICYExistingExpiry
        } else {
            JUICYReferenceBaseDate = Date()
        }
        
        var JUICYDateComponents = DateComponents()
        
        // Define the cadence of the subscription
        switch JUICYPass {
        case .week:
            JUICYDateComponents.day = 7
        case .month:
            JUICYDateComponents.month = 1
        }
        
        // Perform the date transformation
        let JUICYCalculatedDate = JUICYCurrentCalendar.date(byAdding: JUICYDateComponents, to: JUICYReferenceBaseDate)
        
        return JUICYCalculatedDate ?? Date()
    }
}
