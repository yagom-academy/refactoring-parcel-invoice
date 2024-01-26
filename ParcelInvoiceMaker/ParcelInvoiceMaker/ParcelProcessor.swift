//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let reciverInformation: ReceiverInformation
    let costInformation: CostInformation
    let reciptSendMethod: SendMethod

    init(
        address: String, receiverName: String, receiverMobile: String,
        deliveryCost: Int, discount: Discount,
        sendMethod: SendMethod
    ) {
        self.reciverInformation = ReceiverInformation(address: address, name: receiverName, mobile: receiverMobile)
        self.costInformation = CostInformation(deliveryCost: deliveryCost, discount: discount)
        self.reciptSendMethod = sendMethod
    }
}

protocol OrderProcessor {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: OrderProcessor {
    
    private var databasePersistence: ParcelInformationPersistence
    
    init() {
        self.databasePersistence = DatabaseParcelInformationPersistence()
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databasePersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 전송
        let reciptSender: ReciptReciptSender = ReciptReciptSender(method: parcelInformation.reciptSendMethod)
        reciptSender.send(costInformation: parcelInformation.costInformation)
        onComplete(parcelInformation)
    }
    
}
