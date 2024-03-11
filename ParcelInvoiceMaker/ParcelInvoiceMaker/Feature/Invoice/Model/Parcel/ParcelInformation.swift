//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

struct ParcelInformation {
    private let receiverInfo: ParcelReceiverInfo
    private let costInfo: ParcelCostInfo

    init(
        receiverInfo: ParcelReceiverInfo,
        costInfo: ParcelCostInfo
    ) {
        self.receiverInfo = receiverInfo
        self.costInfo = costInfo
    }
}

extension ParcelInformation {
    var discountedCost: Int {
        costInfo.discountedCost
    }
    
    var receiverName: String {
        receiverInfo.nameValue
    }
    var receiverMobile: String {
        receiverInfo.mobileValue
    }
    var receiverAddress: String {
        receiverInfo.addressValue
    }
    
    var receiptContent: String {
        "상품 금액: \(costInfo.deliveryCostValue)\n결제 금액: \(costInfo.discountedCost)"
    }
}
