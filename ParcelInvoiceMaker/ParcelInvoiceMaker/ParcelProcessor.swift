//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct ReceiverInfo {
    let address: String
    var name: String
    var mobile: MobileNumber
}

struct MobileNumber {
    let value: String
    init(value: String) throws {
        let mobileNumberRegex = #"^01[016789]\d{3,4}\d{4}$"#
        
        guard NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex).evaluate(with: value) == true else {
            throw NSError() as Error
        }
        self.value = value
    }
    
    static func valid(with number: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@",
                           #"^01[016789]\d{3,4}\d{4}$"#).evaluate(with: number)
    }
}

extension MobileNumber: CustomStringConvertible {
    var description: String {
        return value
    }
}

final class ParcelInformation {
    var receiverInfo: ReceiverInfo
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        return discount.strategy.applyDiscount(delieveryCost: deliveryCost)
    }

    init(receiverInfo: ReceiverInfo, deliveryCost: Int, discount: Discount) {
        self.receiverInfo = receiverInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

protocol DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int {
        return delieveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int {
        return delieveryCost / 5 * 3
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int {
        return delieveryCost / 2
    }
}

struct SubscribeDiscount: DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int {
        return delieveryCost / 5 * 4
    }
}

enum Discount: Int {
    static let noneTitle: String = "없음"
    static let vipTitle: String = "VIP"
    static let couponTitle: String = "쿠폰"
    static let subscribeTitle: String = "구독"
    
    case none = 0, vip, coupon, subscribe
    var strategy: DiscountStrategy {
        switch self {
        case .none: return NoDiscount()
        case .vip: return VIPDiscount()
        case .coupon: return CouponDiscount()
        case .subscribe: return SubscribeDiscount()
        }
    }
}

enum Receipt {
    static let emailTitle: String = "이메일"
    static let smsTitle: String = "문자"
}

protocol OrderProcessable {
    var persistence: ParcelInformationPersistence { get }
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
    func sendRecipt(parcelInformation: ParcelInformation)
}

final class ParcelOrderProcessor: OrderProcessable {
    let persistence: ParcelInformationPersistence
    
    init(persistence: ParcelInformationPersistence) {
        self.persistence = persistence
    }
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
    
    // 택배 주문 처리 완료 후 영수증 전송
    func sendRecipt(parcelInformation: ParcelInformation) {
        persistence.sendReceipt(parcelInformation: parcelInformation)
    }
}

protocol ParcelInformationPersistence: AnyObject {
    func save(parcelInformation: ParcelInformation)
    func sendReceipt(parcelInformation: ParcelInformation)
}

extension ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print(PersistenceMessage.saveParcelInformation)
    }
    
    func sendReceipt(parcelInformation: ParcelInformation) {
        // 영수증 발송
        print(PersistenceMessage.sendReceipt)
    }
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    static let shared: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
}

struct PersistenceMessage {
    static let saveParcelInformation: String = "발송 정보를 데이터베이스에 저장했습니다."
    static let sendReceipt: String = "영수증을 발송했습니다."
}
