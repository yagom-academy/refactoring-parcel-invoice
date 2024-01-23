//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct ParcelInformation {
    private(set) var receiverInfo: ReceiverInfo
    private(set) var costInfo: CostInfo
    
    init(receiverInfo: ReceiverInfo, costInfo: CostInfo) {
        self.receiverInfo = receiverInfo
        self.costInfo = costInfo
    }
}
