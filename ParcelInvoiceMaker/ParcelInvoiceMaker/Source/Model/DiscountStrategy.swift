//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/05.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int
}

struct NoDiscountStrategy: DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int {
        return deliveryCost.convertToInt()
    }
}

struct VIPDiscountStrategy: DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int {
        let discountedCost = deliveryCost * DiscountRatio.vip
        return discountedCost.convertToInt()
    }
}

struct CouponDiscountStrategy: DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int {
        let discountedCost = deliveryCost * DiscountRatio.coupon
        return discountedCost.convertToInt()
    }
}
