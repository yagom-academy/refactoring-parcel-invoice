//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct ParcelInformation {
    let receiverInfo: ReceiverInfo
    let costInfo: CostInfo
    
    init(receiverInfo: ReceiverInfo, costInfo: CostInfo) {
        self.receiverInfo = receiverInfo
        self.costInfo = costInfo
    }
}
