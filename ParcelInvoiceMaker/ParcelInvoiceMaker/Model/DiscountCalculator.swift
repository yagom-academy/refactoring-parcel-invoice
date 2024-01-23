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
            return Cost(value: cost.value / 5 * 4)
        case .coupon:
            return Cost(value: cost.value / 2)
        }
    }
}
