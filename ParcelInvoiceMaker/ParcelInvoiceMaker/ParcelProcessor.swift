//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let receiverInformation: ReceiverInformation
    let costInformation: CostInformation

    init(receiverInformation: ReceiverInformation, costInformation: CostInformation) {
        self.receiverInformation = receiverInformation
        self.costInformation = costInformation
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

class ParcelOrderProcessor {
    let databasePersistence: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence();
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databasePersistence.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}

class DatabaseParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

struct CostInformation {
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
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
}

struct ReceiverInformation {
    let address: String
    var receiverName: String
    var receiverMobile: String
}

