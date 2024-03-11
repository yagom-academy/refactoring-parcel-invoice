//
//  ParcelCostInfo.swift
//  ParcelInvoiceMaker
//
//  Created by MacBook on 2024/03/04.
//

import Foundation

protocol ValidatedNumeric {
    associatedtype Numeric
    
    var value: Numeric { get set }
    
    static func isValid(_ value: Numeric) -> Bool
    init(value: Numeric) throws
}

struct ParcelDeliveryCost: ValidatedNumeric {
    var value: Int
    
    static func isValid(_ value: Int) -> Bool {
        value >= 0
    }
    
    init(value: Int) throws {
        if !Self.isValid(value) {
            throw ParcelError.costInvalid
        }
        self.value = value
    }
}

protocol DiscountStrategy {
    func canAccept(_ discount: Discount) -> Bool
    func applyDiscount(deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func canAccept(_ discount: Discount) -> Bool {
        discount == .none
    }
    
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func canAccept(_ discount: Discount) -> Bool {
        discount == .vip
    }
    
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost / Discount.VIPRatio
    }
}

struct CouponDiscount: DiscountStrategy {
    func canAccept(_ discount: Discount) -> Bool {
        discount == .coupon
    }
    
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost / Discount.CouponRatio
    }
}

struct EventDiscount: DiscountStrategy {
    func canAccept(_ discount: Discount) -> Bool {
        discount == .event
    }
    
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost / Discount.EventRatio
    }
}

enum Discount: Int {
    case none = 0, vip, coupon, event
    
    static let VIPRatio: Int = 5 * 4
    static let CouponRatio: Int = 2
    static let EventRatio: Int = 10
}

struct ParcelCostInfo {
    private let deliveryCost: ParcelDeliveryCost
    private let discount: Discount
    private let strategies: [DiscountStrategy]
    
    init(
        deliveryCost: ParcelDeliveryCost,
        discount: Discount,
        strategies: [DiscountStrategy]
    ) {
        self.deliveryCost = deliveryCost
        self.discount = discount
        self.strategies = strategies
    }
}

extension ParcelCostInfo {
    var deliveryCostValue: Int {
        deliveryCost.value
    }
    
    var discountedCost: Int {
        strategies
            .first(where: { $0.canAccept(discount) })?
            .applyDiscount(deliveryCost: deliveryCostValue) ?? 0
    }
}
