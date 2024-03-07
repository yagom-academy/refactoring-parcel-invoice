//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost
    }
}
    
struct VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: Discount.vipDiscountRatio)
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: Discount.couponDiscountRatio)
    }
}

struct MistakeCompensationDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: Discount.mistakeCompensationDiscountRatio)
    }
}

fileprivate extension Int {
    func calculateCost(by discountRatio: Double) -> Int {
        Int(Double(self) * discountRatio)
    }
}
