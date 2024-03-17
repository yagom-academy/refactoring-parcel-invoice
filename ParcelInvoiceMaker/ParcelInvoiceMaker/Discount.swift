//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 구민영 on 3/9/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
}

final class VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

final class CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 2
    }
}

final class NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost
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
