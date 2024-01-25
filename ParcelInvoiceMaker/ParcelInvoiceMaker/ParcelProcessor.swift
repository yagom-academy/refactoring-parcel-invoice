//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation
class ReceiverInformation {
    let address : String
    var name : String
    var mobile : String
    
    init(address: String, name: String, mobile: String) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
}
class ParcelInformation {
    let receiver : ReceiverInformation
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }
    init(receiver : ReceiverInformation,deliveryCost: Int, discount: Discount) {
        self.receiver = receiver
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

class ParcelOrderProcessor {
    
    private let databaseParcelInformation = DatabaseParcelInformationPersistence()
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        // 데이터베이스에 주문 저장
        databaseParcelInformation.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }

}

class DatabaseParcelInformationPersistence {
    func save(parcelInformation : ParcelInformation){
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistence {
    func saveData()
}
// ParcelOrderProcessor와 DatabaseParcelInformationPersistence의 의존성을 분리해주기 위해 ParcelInformationPersistence 프로토콜을 정의해주고 DatabaseParcelInformationPersistence가 ParcelInformationPersistence 프로토콜을 따르도록 합니다
