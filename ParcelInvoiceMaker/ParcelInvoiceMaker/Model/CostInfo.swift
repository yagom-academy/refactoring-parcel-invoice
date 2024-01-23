//
//  CostInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct CostInfo {
    let deliveryCost: Cost
    let discountCalculator: DiscountCalculator
    var discountedCost: Cost {
        return discountCalculator.calcDiscountedCost(cost: deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = Cost(value: deliveryCost)
        self.discountCalculator = DiscountCalculator(discount: discount)
    }
}
