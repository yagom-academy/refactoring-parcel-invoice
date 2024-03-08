//
//  CostInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation


struct CostInformation {
    private let discountPolicy: Discount
    private let deliveryCost: Double
    
    init(policy: Discount,
         deliveryCost: Double) {
        self.discountPolicy = policy
        self.deliveryCost = deliveryCost
    }
    
    func calculateTotalCost() -> Int {
        return discountPolicy.calculateDiscountedCost(deliveryCost: deliveryCost)
    }
}
