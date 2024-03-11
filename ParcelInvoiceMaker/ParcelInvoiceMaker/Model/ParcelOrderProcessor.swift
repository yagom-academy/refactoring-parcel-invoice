//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class ParcelOrderProcessor: ParcelProcessor {
    let databaseParcelInformationPersistence: ParcelInformationPersistence
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
