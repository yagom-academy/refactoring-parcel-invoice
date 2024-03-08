//
//  CostInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation


struct CostInformation {
    private let discountInformation: Discount
    private let deliveryCost: Double
    
    init(discount: Discount,
         deliveryCost: Double) {
        self.discountInformation = discount
        self.deliveryCost = deliveryCost
    }
    
    func calculateTotalCost() -> Int {
        return discountInformation.calculateDiscountedCost(deliveryCost: deliveryCost)
    }
}
