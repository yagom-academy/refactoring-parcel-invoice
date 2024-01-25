//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/25.
//

import Foundation

protocol DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost
    }
}

struct VipDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

struct CouponDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
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
            return VipDiscount()
        case .coupon:
            return CouponDiscount()
        }
    }
}
