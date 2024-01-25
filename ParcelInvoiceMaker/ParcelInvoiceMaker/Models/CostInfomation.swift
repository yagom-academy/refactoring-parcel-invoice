//
//  CostInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct CostInfomation {
    let deliveryCost: DeliveryCost
    private let discountStrategy: DiscountStrategy
    var discountedCost: DeliveryCost {
        return discountStrategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    init(deliveryCost: DeliveryCost, discountStrategy: DiscountStrategy) {
        self.deliveryCost = deliveryCost
        self.discountStrategy = discountStrategy
    }
}
