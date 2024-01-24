//
//  ParcelCost.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// 소포 비용
struct ParcelCost {
    let deliveryCost: Double
    private let discountStrategy: DiscountStrategy
    var discountedCost: Int {
        discountStrategy.applyDiscount(deliveryCost)
    }
    
    init(deliveryCost: Double, discountStrategy: DiscountStrategy) {
        self.deliveryCost = deliveryCost
        self.discountStrategy = discountStrategy
    }
    
    func getDiscountedCost() -> Int{
        return discountedCost
    }
}
