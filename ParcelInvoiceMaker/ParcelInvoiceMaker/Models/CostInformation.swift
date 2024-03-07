//
//  CostInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/5/24.
//

import Foundation

struct CostInformation {
    init(deliveryCost: Cost, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    private let deliveryCost: Cost
    private let discount: Discount
    
    var discountedCost: Int {
        return discount.strategy.applyDiscount(deliveryCost: deliveryCost.cost)
    }
}

struct Cost {
    let cost: Int
    
    init?(cost: Int) {
        if cost < 0 {
            return nil
        }
        
        self.cost = cost
    }
}
