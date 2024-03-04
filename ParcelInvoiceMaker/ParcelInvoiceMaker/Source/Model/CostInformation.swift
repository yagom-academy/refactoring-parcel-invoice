//
//  CostInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
}

struct CostInformation {
    private let policy: Discount
    private let deliveryCost: Int
    
    init(policy: Discount,
         deliveryCost: Int) {
        self.policy = policy
        self.deliveryCost = deliveryCost
    }
    
    func getDiscountedCost() -> Int {
        switch policy {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }
}
