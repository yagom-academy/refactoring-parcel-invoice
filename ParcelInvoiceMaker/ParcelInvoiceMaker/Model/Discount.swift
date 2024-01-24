//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/24/24.
//

import Foundation


//MARK: Discount
protocol DiscountStrategy {
    var discountType: String { get }
    func applyDiscount(deliveryCost: Cost) -> Cost
}

struct NoDiscount: DiscountStrategy {
    private(set) var discountType: String = "없음"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value)
    }
}

struct VIPDiscount: DiscountStrategy {
    private(set) var discountType: String = "VIP"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value / 5 * 4)
    }
}

struct CouponDiscount: DiscountStrategy {
    private(set) var discountType: String = "쿠폰"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value / 2)
    }
}

struct EventDiscount: DiscountStrategy {
    private(set) var discountType: String = "이벤트"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value / 3)
    }
}

struct DiscountStrategyFactory {
    private static var strategies: [DiscountStrategy] = [
        VIPDiscount(),
        CouponDiscount(),
        NoDiscount(),
        EventDiscount()
    ]

    static func createStrategy(type: String) -> DiscountStrategy {
        let discountStrategy = strategies.first(where: { $0.discountType == type })
        return discountStrategy ?? NoDiscount()
    }
}
