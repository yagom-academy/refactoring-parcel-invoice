//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelOrderProcessor {
    
    func process(
        parcelInformation: ParcelInformation,
        receiptInfo: ReceiptProvideInfo,
        onComplete: (ParcelInformation) -> Void
    )
}

final class ParcelOrderProcessorImpl: ParcelOrderProcessor {
    
    private let databaseParcelInformationPersistence: ParcelInformationPersistence
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
}

extension ParcelOrderProcessorImpl {
    
    // 택배 주문 처리 로직
    func process(
        parcelInformation: ParcelInformation,
        receiptInfo: ReceiptProvideInfo,
        onComplete: (ParcelInformation) -> Void
    ) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 전송
        receiptInfo.sendReceipt()
        
        onComplete(parcelInformation)
    }
}
