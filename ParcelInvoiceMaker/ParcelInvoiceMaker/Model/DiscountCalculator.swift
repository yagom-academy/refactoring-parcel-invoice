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
        let discountedCost = discount.strategy.applyDiscount(deliveryCost: cost.value)
        return Cost(value: discountedCost)
    }
}
