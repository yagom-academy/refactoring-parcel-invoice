//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/25/24.
//

import Foundation

protocol DiscountStrategy {
    var discountRate: Double { get }
    
    func applyDiscount(deliveryCost: Int) -> Int
    func canAccept(method: Discount) -> Bool
}

extension DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return Int(Double(deliveryCost) * discountRate)
    }
}

struct NoDiscount: DiscountStrategy {
    var discountRate: Double
    
    init(discountRate: Double) {
        self.discountRate = discountRate
    }
    
    func canAccept(method: Discount) -> Bool {
        return method == .none
    }
}

struct VIPDiscount: DiscountStrategy {
    var discountRate: Double
    
    init(discountRate: Double) {
        self.discountRate = discountRate
    }
    
    func canAccept(method: Discount) -> Bool {
        return method == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    var discountRate: Double
    
    init(discountRate: Double) {
        self.discountRate = discountRate
    }
    
    func canAccept(method: Discount) -> Bool {
        return method == .coupon
    }
}
