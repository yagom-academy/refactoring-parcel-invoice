//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation


//MARK: - ParcelInformationPersistence
protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    init() {
        
    }
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}


//MARK: - ParcelProcessing
protocol ParcelProcessing {
    func process(parcelInformation: ParcelInformation,
                 onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessor: ParcelProcessing {
    
    private let persistence: ParcelInformationPersistence
    
    init(parcelPersistence: ParcelInformationPersistence) {
        self.persistence = parcelPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation,
                 onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        
        let receiptDispatcher = parcelInformation.receiptStrategy
        receiptDispatcher.sendReceipt()
        
        onComplete(parcelInformation)
    }
}
