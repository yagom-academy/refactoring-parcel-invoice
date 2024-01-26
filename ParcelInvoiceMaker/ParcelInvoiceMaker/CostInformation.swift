//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/24.
//

import Foundation

struct CostInformation {
    let deliveryCost: Int
    private var strategy: DiscountStrategy?
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        
        let strategies: [DiscountStrategy] = [NoDiscount(), VipDiscount(), CouponDiscount()]
        strategy = strategies.first { $0.canApply(discount) }
    }
    
    func discountedCost() -> Int? {
        return strategy?.discountedCost(deliveryCost)
    }
}
