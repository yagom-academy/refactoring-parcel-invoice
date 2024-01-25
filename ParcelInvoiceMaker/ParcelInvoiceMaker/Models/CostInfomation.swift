//
//  CostInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct CostInfomation {
    let deliveryCost: DeliveryCost
    private let discount: Discount
    var discountedCost: DeliveryCost {
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return (try? .init(deliveryCost.value / 5 * 4)) ?? deliveryCost
        case .coupon:
            return (try? .init(deliveryCost.value / 2)) ?? deliveryCost
        }
    }
    
    init(deliveryCost: DeliveryCost, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
