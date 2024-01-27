//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

enum Discount: Int {
    case none = 0
    case vip
    case coupon
    
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
