//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelOrderProcessor {
    
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessorImpl: ParcelOrderProcessor {
    
    private let databaseParcelInformationPersistence: ParcelInformationPersistence
    private let receiptProvider: ReceiptProvider
    
    init(
        databaseParcelInformationPersistence: ParcelInformationPersistence,
        receiptProvider: ReceiptProvider
    ) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
        self.receiptProvider = receiptProvider
    }
}

extension ParcelOrderProcessorImpl {
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 전송
        Task {
            await receiptProvider.send(content: parcelInformation.receiptContent)
        }
        
        onComplete(parcelInformation)
    }
}
