//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
    
    var strategy: DiscountStrategy {
        let strategies: [DiscountStrategy] = [
            NoDiscount(discountRate: DiscountRate.none),
            VIPDiscount(discountRate: DiscountRate.vip),
            CouponDiscount(discountRate: DiscountRate.coupon)
        ]
        
        return strategies
            .filter { $0.canAccept(method: self) }
            .first ?? NoDiscount(discountRate: DiscountRate.none)
    }
}

enum DiscountRate {
    static let none: Double = 1.0
    static let vip: Double = 0.8
    static let coupon: Double = 0.5
}
