//
//  CostInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/5/24.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
}

struct CostInformation {
    init(deliveryCost: Cost, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    private let deliveryCost: Cost
    private let discount: Discount
    
    var discountedCost: Int {
        switch discount {
        case .none:
            return deliveryCost.cost
        case .vip:
            return deliveryCost.cost / 5 * 4
        case .coupon:
            return deliveryCost.cost / 2
        }
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
