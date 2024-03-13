//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let address: String
    var receiverInfo: ReceiverInfo
    var costInfo: CostInfo

    init(address: String, receiverName: String, receiverMobile: String, deliveryCost: Int, discount: Discount) {
        self.address = address
        self.receiverInfo = ReceiverInfo(receiverNameInfo: receiverName, receiverMobileInfo: receiverMobile)
        self.costInfo = CostInfo(deliveryCost: deliveryCost, discount: discount)
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
    var strategy: DiscountStrategy {
        switch self {
        case .none:
            return NoDiscount()
        case .vip:
            return VIPDiscount()
        case .coupon:
            return CouponDiscount()
        }
    }
}

class ReceiverInfo {
    private(set) var receiverNameInfo: String
    private(set) var receiverMobileInfo: String
        
    init(receiverNameInfo: String, receiverMobileInfo: String) {
        self.receiverNameInfo = receiverNameInfo
        self.receiverMobileInfo = receiverMobileInfo
    }
    
    func receiverName() -> String {
        return receiverNameInfo
    }
    
    func receiverMobile() -> String {
        return receiverMobileInfo
    }
}

class CostInfo {
    private(set) var deliveryCost: Int
    private(set) var discount: Discount
    private(set) var discountedCost: Int
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
        self.discountedCost = 0
        self.discountedCost = discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    func getDiscountedCost() -> Int {
        return discountedCost
    }
}

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 2
    }
}

class ParcelOrderProcessor: ParcelOrderService {
    
    var parcelInformationPersistence: ParcelInformationPersistence
    
    init(parcelInformationPersistence: ParcelInformationPersistence) {
        self.parcelInformationPersistence = parcelInformationPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        parcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}
