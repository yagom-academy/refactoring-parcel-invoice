//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let receiverInfomation: ReceiverInfomation
    let costInfomation: CostInfomation

    init(receiverInfomation: ReceiverInfomation, costInfomation: CostInfomation) {
        self.receiverInfomation = receiverInfomation
        self.costInfomation = costInfomation
    }
}


class ParcelOrderProcessor {
    private let database: ParcelInformationPersistence
    
    init(database: ParcelInformationPersistence) {
        self.database = database
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        database.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}
