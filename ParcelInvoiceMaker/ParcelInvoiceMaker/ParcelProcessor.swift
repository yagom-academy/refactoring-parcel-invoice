//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class ParcelInformation {
    let address: String
    let receiverInfomation: ReceiverInfomation
    let costInfomation: CostInfomation
    
    init(address: String, receiverInfomation: ReceiverInfomation, costInfomation: CostInfomation) {
        self.address = address
        self.receiverInfomation = receiverInfomation
        self.costInfomation = costInfomation
    }
}

class ReceiverInfomation {
    var receiverName: String
    var receiverMobile: String
    
    init(receiverName: String, receiverMobile: String) {
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
    }
}

class CostInfomation {
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
    
    init(deliveryCost: Int, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

protocol ParcelProcessorProtocol {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: ParcelProcessorProtocol {
    let databaseParcelInformationPersistence: ParcelInformationPersistence
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}
