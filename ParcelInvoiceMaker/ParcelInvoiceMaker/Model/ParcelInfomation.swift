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

struct ReceiverInfomation {
    var receiverName: String
    var receiverMobile: String
}

struct CostInfomation {
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
}

enum Discount: Int {
    case none = 0, vip, coupon
}
