//
//  ParcelInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/6/24.
//

import Foundation

class ParcelInformation {
    let address: String
    let receiverInfomation: ReceiverInfomation
    let costInfomation: CostInfomation
    
    init(address: String, receiverInfomation: ReceiverInfomation, costInfomation: CostInfomation) {
        self.address = address
        self.receiverInfomation = receiverInfomation
        self.costInfomation = costInfomation
    }
}

class ReceiverInfomation {
    var receiverName: String
    var receiverMobile: String
    
    init(receiverName: String, receiverMobile: String) {
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
    }
}

class CostInfomation {
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
