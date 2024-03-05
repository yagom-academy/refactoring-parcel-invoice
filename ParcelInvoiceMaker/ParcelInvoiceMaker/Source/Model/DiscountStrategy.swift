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
        return Int(deliveryCost)
    }
}

struct VIPDiscountStrategy: DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int {
        return Int(deliveryCost * DiscountRatio.vip)
    }
}

struct CouponDiscountStrategy: DiscountStrategy {
    func applyDiscount(deliveryCost: Double) -> Int {
        return Int(deliveryCost * DiscountRatio.coupon)
    }
}
