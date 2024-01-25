//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// DatabaseParcelInformationPersistence와 ParcelOrderProcessor를 위한 파일을 따로 따로 만들어서 분리해야 할까요?

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}




protocol ParcelOrderProcessorProtocol {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: ParcelOrderProcessorProtocol {
    // DatabaseParcelInformationPersistence 타입 대신에 추상화 주입
    private let parcelInformationPersistence: ParcelInformationPersistence
    
    init(parcelInformationPersistence: ParcelInformationPersistence) {
        self.parcelInformationPersistence = parcelInformationPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        parcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
}
