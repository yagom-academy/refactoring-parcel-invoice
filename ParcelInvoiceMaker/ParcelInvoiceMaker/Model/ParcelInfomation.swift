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
