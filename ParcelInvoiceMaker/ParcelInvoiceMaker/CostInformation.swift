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
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}
