//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol OrderProcessable {
    var persistence: ParcelInformationPersistence { get }
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessor: OrderProcessable {
    let persistence: ParcelInformationPersistence
    
    init(persistence: ParcelInformationPersistence) {
        self.persistence = persistence
    }
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

extension ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    static let shared: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
}
