//
//  ParcelCost.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// 소포 비용
struct ParcelCost {
    private let deliveryCost: Cost
    private let discountStrategy: DiscountStrategy
    private var discountedCost: Int {
        discountStrategy.applyDiscount(deliveryCost.getValue())
    }
    
    init(deliveryCost: Cost, discountStrategy: DiscountStrategy) {
        self.deliveryCost = deliveryCost
        self.discountStrategy = discountStrategy
    }
    
    func getDiscountedCost() -> Int{
        return discountedCost
    }
}
