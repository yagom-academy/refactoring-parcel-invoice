//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost) -> DeliveryCost
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost) -> DeliveryCost {
        return deliveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost) -> DeliveryCost {
        return (try? .init(deliveryCost.value / 5 * 4)) ?? deliveryCost
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost) -> DeliveryCost {
        return (try? .init(deliveryCost.value / 2)) ?? deliveryCost
    }
}
