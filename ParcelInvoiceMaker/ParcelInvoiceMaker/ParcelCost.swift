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
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
            return Int(deliveryCost)
        case .vip:
            return Int(deliveryCost * DiscountRate.vip)
        case .coupon:
            return Int(deliveryCost * DiscountRate.coupon)
        }
    }
    
    init(deliveryCost: Double, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    func getDiscountedCost() -> Int{
        return discountedCost
    }
}
