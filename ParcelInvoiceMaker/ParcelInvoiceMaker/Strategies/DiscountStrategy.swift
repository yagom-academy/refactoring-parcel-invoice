//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/6/24.
//

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
        return deliveryCost * 4 / 5
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
