//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

final class ParcelInformation {
    let receiverInfomation: ReceiverInfomation
    let costInfomation: CostInfomation

    init(receiverInfomation: ReceiverInfomation, costInfomation: CostInfomation) {
        self.receiverInfomation = receiverInfomation
        self.costInfomation = costInfomation
    }
}
