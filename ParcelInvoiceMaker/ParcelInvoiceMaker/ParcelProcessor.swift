//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelOrderable {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: ParcelOrderable {
    private let dataBase: ParcelInformationPersistence
    
    init() {
        self.dataBase = DatabaseParcelInformationPersistence()
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        dataBase.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
