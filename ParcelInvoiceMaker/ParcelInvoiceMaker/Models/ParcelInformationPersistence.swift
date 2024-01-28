//
//  ParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
