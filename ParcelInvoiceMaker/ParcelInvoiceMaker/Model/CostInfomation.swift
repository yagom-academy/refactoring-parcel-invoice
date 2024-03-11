//
//  CostInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon, mistakeCompensation
    
    static let vipDiscountRatio: Double = 0.8
    static let couponDiscountRatio: Double = 0.5
    static let mistakeCompensationDiscountRatio: Double = 0.7
    
    var strategy: DiscountStrategy {
        switch self {
        case .none: NoDiscount()
        case .vip: VIPDiscount()
        case .coupon: CouponDiscount()
        case .mistakeCompensation: MistakeCompensationDiscount()
        }
    }
}

struct CostInfomation {
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
