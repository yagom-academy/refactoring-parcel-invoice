//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct BusinessLogic {
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
}

// 택배정보 입력 에러
enum ParcelInformationError: Int, Error {
    case nameError = 0,
         mobileError
}

struct Name {
    private let value: String
    
    init(value: String) throws {
        try BusinessLogic.validateName(value)
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Mobile {
    private let value: String
    
    init(value: String) throws {
        try BusinessLogic.validateMobile(value)
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Receiver {
    private let name: Name
    private let mobile: Mobile
    
    func getName() -> String {
        return name.getValue()
    }
    
    func getMobile() -> String {
        return mobile.getValue()
    }
}

enum Discount: Int {
    case none = 0,
         vip,
         coupon
}

protocol DiscountStrategy {
    func getDiscountedCost(of cost: Int) -> Int
    func canAccept(type: Discount) -> Bool
}

struct NoneDiscountStrategy: DiscountStrategy {
    func getDiscountedCost(of cost: Int) -> Int {
        return cost
    }
    
    func canAccept(type: Discount) -> Bool {
        return type == .none
    }
}

struct VipDiscountStrategy: DiscountStrategy {
    func getDiscountedCost(of cost: Int) -> Int {
        return cost / 5 * 4
    }
    
    func canAccept(type: Discount) -> Bool {
        return type == .vip
    }
}

struct CouponStrategy: DiscountStrategy {
    func getDiscountedCost(of cost: Int) -> Int {
        return cost / 2
    }
    
    func canAccept(type: Discount) -> Bool {
        return type == .coupon
    }
}

struct Cost {
    let value: Int
    let strategies: [DiscountStrategy]
    
    init(value: Int, strategies: [DiscountStrategy]) {
        self.value = value
        self.strategies = strategies
    }
    
    func getDiscountedCost(with type: Discount) -> Int {
        strategies.filter { $0.canAccept(type: type) }
            .first?
            .getDiscountedCost(of: value) ?? 0
    }
}

class ParcelInformation {
    let address: String
    let receiver: Receiver
    let deliveryCost: Cost

    init(address: String, receiver: Receiver, deliveryCost: Cost) {
        self.address = address
        self.receiver = receiver
        self.deliveryCost = deliveryCost
    }
}

class ParcelOrderProcessor {
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
