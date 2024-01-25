//
//  ParcelInformation.swift
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
    let discount: Discount
    var discountedCost: Int {
        return discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

struct ParcelInputData {
    var name: String
    var mobile: String
    var address: String
    var cost: Int
    var discount: Discount
}
