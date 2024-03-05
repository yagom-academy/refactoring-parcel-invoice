//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

class ParcelInformation {
    private let receiverInfo: ParcelReceiverInfo
    private let costInfo: ParcelCostInfo
    
    var discountedCost: Int {
        switch costInfo.discount {
        case .none:
            return costInfo.deliveryCost.value
        case .vip:
            return costInfo.deliveryCost.value / 5 * 4
        case .coupon:
            return costInfo.deliveryCost.value / 2
        }
    }
    
    var receiverName: String {
        receiverInfo.receiverName.value
    }
    var receiverMobile: String {
        receiverInfo.receiverMobile.value
    }
    var receiverAddress: String {
        receiverInfo.address.value
    }

    init(
        receiverInfo: ParcelReceiverInfo,
        costInfo: ParcelCostInfo
    ) {
        self.receiverInfo = receiverInfo
        self.costInfo = costInfo
    }
}
