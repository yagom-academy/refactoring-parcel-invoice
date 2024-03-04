//
//  ParcelReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

protocol ValidatedString {
    var value: String { get set }
    
    static func isValid(_ value: String) -> Bool
    init(value: String) throws
}

protocol ValidatedNumeric {
    associatedtype Numeric
    
    var value: Numeric { get set }
    
    static func isValid(_ value: Numeric) -> Bool
    init(value: Numeric) throws
}

struct ParcelReceiverName: ValidatedString {
    var value: String
    
    static func isValid(_ value: String) -> Bool {
        // 정규식 pattern. 한글, 영어, 숫자, 밑줄(_)만 있어야함
        let pattern: String = "^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9_]$"
        return pattern.range(of: value, options: .regularExpression) != nil
    }
    
    init(value: String) throws {
        if !Self.isValid(value) {
            throw ParcelError.nameInvalid
        }
        self.value = value
    }
}

struct ParcelReceiverMobile: ValidatedString {
    var value: String
    
    static func isValid(_ value: String) -> Bool {
        // 정규식 pattern. 전화번호 형식에 맞아야함
        let pattern: String = #"^\(?\d{3,4}\)?[ -]?\d{3,4}[ -]?\d{4}$"#
        return pattern.range(of: value, options: .regularExpression) != nil
    }
    
    init(value: String) throws {
        if !Self.isValid(value) {
            throw ParcelError.phoneInvalid
        }
        self.value = value
    }
}

struct ParcelReceiverAddress: ValidatedString {
    var value: String
    
    static func isValid(_ value: String) -> Bool {
        !value.isEmpty
    }
    
    init(value: String) throws {
        if !Self.isValid(value) {
            throw ParcelError.addressInvalid
        }
        self.value = value
    }
}

struct ParcelReceiverInfo {
    let receiverName: ParcelReceiverName
    let receiverMobile: ParcelReceiverMobile
    let address: ParcelReceiverAddress
}
