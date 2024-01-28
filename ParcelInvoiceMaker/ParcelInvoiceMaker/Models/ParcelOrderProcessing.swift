//
//  ParcelInvoiceMaker - ParcelOrderProcessing.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelOrderProcessing {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: ParcelOrderProcessing {
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
