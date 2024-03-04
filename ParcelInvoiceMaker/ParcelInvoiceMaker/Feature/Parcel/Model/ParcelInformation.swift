//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

class ParcelInformation {
    private let receiverInfo: ParcelReceiverInfo
    private let deliveryCost: ParcelDeliveryCost
    private let discount: Discount
    
    var discountedCost: Int {
        switch discount {
        case .none:
            return deliveryCost.value
        case .vip:
            return deliveryCost.value / 5 * 4
        case .coupon:
            return deliveryCost.value / 2
        }
    }

    init(
        receiverInfo: ParcelReceiverInfo,
        deliveryCost: ParcelDeliveryCost,
        discount: Discount
    ) {
        self.receiverInfo = receiverInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}
