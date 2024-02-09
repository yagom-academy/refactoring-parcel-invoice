//
//  CostInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct CostInfo {
    private var deliveryCost: Cost
    private var discountedCost: Cost
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = Cost(value: deliveryCost)
        let discountedCost: Int = discount.strategy.applyDiscount(deliveryCost: deliveryCost)
        self.discountedCost = Cost(value: discountedCost)
    }
    
    func getDiscountedCost() -> Int {
        return discountedCost.value
    }
}
