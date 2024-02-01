//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

final class ParcelInformation {
    let receiver: ReceiverInfomation
    let cost: CostInfomation

    init(receiverInfomation: ReceiverInfomation, costInfomation: CostInfomation) {
        self.receiver = receiverInfomation
        self.cost = costInfomation
    }
}
