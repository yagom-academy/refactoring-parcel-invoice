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

struct ParcelReceiverName: ValidatedString {
    typealias ErrorType = ParcelError
    
    var value: String
    
    static func isValid(_ value: String) -> Bool {
        // 정규식 pattern. 한글, 영어, 숫자, 밑줄(_)만 있어야함
        let pattern: String = "^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9_]+$"
        return value.range(of: pattern, options: .regularExpression) != nil
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
        return value.range(of: pattern, options: .regularExpression) != nil
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
    private let name: ParcelReceiverName
    private let mobile: ParcelReceiverMobile
    private let address: ParcelReceiverAddress
    
    init(
        name: ParcelReceiverName,
        mobile: ParcelReceiverMobile,
        address: ParcelReceiverAddress
    ) {
        self.name = name
        self.mobile = mobile
        self.address = address
    }
}

extension ParcelReceiverInfo {
    var nameValue: String {
        name.value
    }
    
    var mobileValue: String {
        mobile.value
    }
    
    var addressValue: String {
        address.value
    }
}
