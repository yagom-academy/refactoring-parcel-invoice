//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/24.
//

import Foundation

struct CostInformation {
    let deliveryCost: Int
    private let discount: Discount
    
    var discountedCost: Int {
        let discountStrategy: DiscountStrategy = discount.strategy
        return discountStrategy.discountedCost(self.deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
