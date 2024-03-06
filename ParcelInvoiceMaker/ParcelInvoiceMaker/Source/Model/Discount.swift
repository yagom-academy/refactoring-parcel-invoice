//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/05.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
    private var strategy: DiscountStrategy {
        switch self {
        case .none:
            return NoDiscountStrategy()
        case .vip:
            return VIPDiscountStrategy()
        case .coupon:
            return CouponDiscountStrategy()
        }
    }
    
    func calculateDiscountedCost(deliveryCost: Double) -> Int {
        return strategy.applyDiscount(deliveryCost: deliveryCost)
    }
}
