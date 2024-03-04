//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
}

struct ParcelInformation {
    private let receiverInformation: ReceiverInformation
    private let deliveryCost: Int
    private let discount: Discount
    
    init(receiverInformation: ReceiverInformation,
         deliveryCost: Int,
         discount: Discount)
    {
        self.receiverInformation = receiverInformation
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    func getReceiverName() -> String {
        return receiverInformation.getReceiverName()
    }
    
    func getReceiverAddress() -> String {
        return receiverInformation.getAddress()
    }
    
    func getReceiverMobile() -> String {
        return receiverInformation.getReceiverMobile()
    }
    
    func getDiscountedCost() -> Int {
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
