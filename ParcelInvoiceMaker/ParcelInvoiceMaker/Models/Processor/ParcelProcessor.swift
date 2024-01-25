//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelOrderProcessor {
    // SOLID DIP 적용 추상화된 프로토콜을 가지도록 수정
    private let databaseParcelInformationPersistence: ParcelInformationPersistence
    private let receiptProcessor: ReceiptManageable
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence,
         receiptProcessor: ReceiptManageable) {
        // 인스턴스를 생성해 주입
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
        self.receiptProcessor = receiptProcessor
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformationProvider, onComplete: (ParcelInformationProvider) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 발송
        receiptProcessor.send(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

