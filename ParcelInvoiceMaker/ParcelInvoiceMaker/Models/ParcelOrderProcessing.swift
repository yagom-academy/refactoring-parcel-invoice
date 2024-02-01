//
//  ParcelInvoiceMaker - ParcelOrderProcessing.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol ParcelOrderProcessing {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessor: ParcelOrderProcessing {
    private let database: ParcelInformationSavable
    
    init(database: ParcelInformationSavable) {
        self.database = database
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        database.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}
