//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let reciverInformation: ReceiverInformation
    let costInformation: CostInformation

    init(address: String, receiverName: String, receiverMobile: String, deliveryCost: Int, discount: Discount) {
        self.reciverInformation = ReceiverInformation(address: address, name: receiverName, mobile: receiverMobile)
        self.costInformation = CostInformation(deliveryCost: deliveryCost, discount: discount)
    }
}

class ParcelOrderProcessor {
    
    private let databasePersistence: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databasePersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
}
