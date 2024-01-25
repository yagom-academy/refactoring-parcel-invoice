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
    private let persistence: ParcelInformationPersistence

    init(persistence: ParcelInformationPersistence) {
        self.persistence = persistence
    }

    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}


class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}


protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

