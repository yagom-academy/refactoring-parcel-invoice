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

struct Charge {
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
