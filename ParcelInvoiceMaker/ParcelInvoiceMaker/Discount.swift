//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by TelosMac on 1/26/24.
//

import Foundation

// Discount types and rates
enum Discount: Int {
    case none = 0, vip, coupon, holiday
    
    var rate: Double {
           switch self {
           case .none:
               return 1 // no discount
           case .vip:
               return 0.8  // 20% discount
           case .coupon:
               return 0.5  // 50% discount
           case .holiday:
               return 0.85  // 15% discount
           }
       }
}


// Discount Strategy Protocol
protocol DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost, discountRate: Double) -> Int
    func canAccept(discount: Discount) -> Bool
}

extension DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost, discountRate: Double) -> Int {
        Int(deliveryCost.cost * discountRate)
    }
}


// Discount Strategies
struct NoDiscount: DiscountStrategy {
    func canAccept(discount: Discount) -> Bool {
        return discount == .none
    }
}

struct VIPDiscount: DiscountStrategy {
    func canAccept(discount: Discount) -> Bool {
        return discount == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    func canAccept(discount: Discount) -> Bool {
        return discount == .coupon
    }
}

// 이 새로운 전략은 테스트로 추가했습니다.
struct HolidayDiscount: DiscountStrategy {
    func canAccept(discount: Discount) -> Bool {
        return discount == .holiday
    }
}
