//
//  BusinessLogic.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

protocol ParcelOrderValidatorProtocol {
    static func validate(address: String) -> Bool
    static func validate(name: String) -> Bool
    static func validate(mobile: String) -> Bool
    static func validate(cost: Int) -> Bool
}

struct ParcelOrderValidator: ParcelOrderValidatorProtocol {
    // 주소 유효성 체크
    static func validate(address: String) -> Bool {
        guard !address.isEmpty else {
            return false
        }
        
        return true
    }
    
    // 이름 유효성 체크
    static func validate(name: String) -> Bool {
        guard !name.isEmpty else {
            return false
        }
        
        return true
    }
    
    // 전화번호 유효성 체크
    static func validate(mobile: String) -> Bool {
        let pattern = "^01[0-1,7][0-9]{7,8}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        guard ((regex?.firstMatch(in: mobile, range: NSRange(location: 0, length: mobile.count))) != nil) else {
            return false
        }
        
        return true
    }
    
    // 요금 유효성 체크
    static func validate(cost: Int) -> Bool {
        guard cost >= 0 else {
            return false
        }
        
        return true
    }
}
