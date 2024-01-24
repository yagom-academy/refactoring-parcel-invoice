//
//  DatabaseParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformationProvider) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformationProvider)
}
