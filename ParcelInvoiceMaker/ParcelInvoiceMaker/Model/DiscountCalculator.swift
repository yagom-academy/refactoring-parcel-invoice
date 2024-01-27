//
//  DiscountCalculator.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct DiscountCalculator {
    private let discount: Discount
    
    init(discount: Discount) {
        self.discount = discount
    }
    
    func calcDiscountedCost(cost: Cost) -> Cost {
        switch discount {
        case .none:
            return cost
        case .vip:
            let costValue: Int = Int(Double(cost.value) * DiscountRate.vip)
            return Cost(value: costValue)
        case .coupon:
            let costValue: Int = Int(Double(cost.value) * DiscountRate.coupon)
            return Cost(value: costValue)
        }
    }
}

enum DiscountRate {
    static let vip: Double = 0.8
    static let coupon: Double = 0.5
}
