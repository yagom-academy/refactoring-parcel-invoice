//
//  BusinessLogic.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

struct BusinessLogic {
    // 주소 유효성 체크
    static func validateAddress(_ address: String) throws {
        guard !address.isEmpty else {
            throw ParcelInformationError.addressError
        }
    }
    
    // 이름 유효성 체크
    static func validateName(_ name: String) throws {
        guard !name.isEmpty else {
            throw ParcelInformationError.nameError
        }
    }
    
    // 전화번호 유효성 체크
    static func validateMobile(_ mobile: String) throws {
        let pattern = "^01[0-1,7][0-9]{7,8}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        guard ((regex?.firstMatch(in: mobile, range: NSRange(location: 0, length: mobile.count))) != nil) else {
            throw ParcelInformationError.mobileError
        }
    }
    
    // 요금 유효성 체크
    static func validateDeliveryCost(_ cost: Int) throws {
        guard cost >= 0 else {
            throw ParcelInformationError.deliveryCostError
        }
    }
}
