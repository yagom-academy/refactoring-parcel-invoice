//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/25.
//

import Foundation

protocol DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int
    func canApply(_ discount: Discount) -> Bool
}

struct NoDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost
    }
    
    func canApply(_ discount: Discount) -> Bool {
        return discount == .none
    }
}

struct VipDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
    
    func canApply(_ discount: Discount) -> Bool {
        return discount == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost / 2
    }
    
    func canApply(_ discount: Discount) -> Bool {
        return discount == .coupon
    }
}

struct NewcomerDiscount: DiscountStrategy {
    func discountedCost(_ deliveryCost: Int) -> Int {
        return deliveryCost / 10 * 9
    }
    
    func canApply(_ discount: Discount) -> Bool {
        return discount == .newcomer
    }
}

enum Discount: Int {
    case none = 0, vip, coupon, newcomer
}
