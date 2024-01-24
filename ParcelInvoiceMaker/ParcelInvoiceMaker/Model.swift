//
//  Model.swift
//  ParcelInvoiceMaker
//
//  Created by Kant on 1/24/24.
//

import Foundation

struct ParcelInformation {
    let receiver: Receiver
    let charge: Charge
    
    init(receiver: Receiver, charge: Charge) {
        self.receiver = receiver
        self.charge = charge
    }
}

struct Receiver {
    let address: String
    var receiverName: String
    var receiverMobile: String
    
    init(address: String, receiverName: String, receiverMobile: String) {
        self.address = address
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
    }
}

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
    func canAccept(method: Discount) -> Bool
}

struct NoDiscount: DiscountStrategy { 
    func applyDiscount(deliveryCost: Int) -> Int { return deliveryCost }
    func canAccept(method: Discount) -> Bool {
        return method == .none
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int { return (deliveryCost / 5) * 4 }
    func canAccept(method: Discount) -> Bool {
        return method == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int { return deliveryCost / 2}
    func canAccept(method: Discount) -> Bool {
        return method == .coupon
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
    
    var strategy: DiscountStrategy {
        switch self {
        case .none: NoDiscount()
        case .vip: VIPDiscount()
        case .coupon: CouponDiscount()
        }
    }
}

struct Charge {
    let deliveryCost: Int
    let discount: Discount
    var discountedCost: Int {
        return discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
