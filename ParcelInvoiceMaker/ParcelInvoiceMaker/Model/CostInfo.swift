//
//  CostInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct CostInfo {
    private(set) var deliveryCost: Cost
    private let discountCalculator: DiscountCalculator
    private var discountedCost: Cost {
        return discountCalculator.calcDiscountedCost(cost: deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = Cost(value: deliveryCost)
        self.discountCalculator = DiscountCalculator(discount: discount)
    }
    
    func getDiscountedCost() -> Int {
        return discountedCost.value
    }
}
