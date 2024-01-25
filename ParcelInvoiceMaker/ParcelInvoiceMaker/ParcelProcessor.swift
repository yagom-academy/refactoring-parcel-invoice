//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation
class ReceiverInformation {
    let address : String
    var name : String
    var mobile : String
    
    init(address: String, name: String, mobile: String) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
}
class ParcelInformation {
    let receiver: ReceiverInformation
    let deliveryCost: Int
    private let discount: Discount

    var discountedCost: Int {
        return discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }

    init(receiver: ReceiverInformation, deliveryCost: Int, discount: Discount) {
        self.receiver = receiver
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
class ParcelOrderProcessor {
    private let persistence: ParcelInformationPersistence

    init(persistence: ParcelInformationPersistence) {
        self.persistence = persistence
    }

    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}


class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}


protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
}

class NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost
    }
}

class VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

class CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 2
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
