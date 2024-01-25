//
//  Discount+Strategy.swift
//  ParcelInvoiceMaker
//
//  Created by 강동영 on 1/26/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(to delieveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(to delieveryCost: Int) -> Int {
        return delieveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 3
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(to delieveryCost: Int) -> Int {
        return delieveryCost / 2
    }
}

struct SubscribeDiscount: DiscountStrategy {
    func applyDiscount(to delieveryCost: Int) -> Int {
        return delieveryCost / 5 * 4
    }
}

struct SubscribeDiscount: DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

enum Discount: Int {
    case none = 0, vip, coupon, subscribe
    var strategy: DiscountStrategy {
        switch self {
        case .none: return NoDiscount()
        case .vip: return VIPDiscount()
        case .coupon: return CouponDiscount()
        case .subscribe: return SubscribeDiscount()
        }
    }
    
    var title: String {
        switch self {
        case .none: return "없음"
        case .vip: return "VIP"
        case .coupon: return "쿠폰"
        case .subscribe: return "구독"
        }
    }
}
