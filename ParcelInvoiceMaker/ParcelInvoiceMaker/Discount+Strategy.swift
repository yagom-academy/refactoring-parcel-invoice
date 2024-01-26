//
//  Discount+Strategy.swift
//  ParcelInvoiceMaker
//
//  Created by 강동영 on 1/26/24.
//

import Foundation

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
        return delieveryCost / 5 * 4
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(delieveryCost: Int) -> Int {
        return delieveryCost / 2
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
    var strategy: DiscountStrategy {
        switch self {
        case .none: return NoDiscount()
        case .vip: return VIPDiscount()
        case .coupon: return CouponDiscount()
        }
    }
}
