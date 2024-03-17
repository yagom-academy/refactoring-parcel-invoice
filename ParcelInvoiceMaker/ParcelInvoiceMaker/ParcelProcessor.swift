//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct Receiver {
    let address: String
    let name: String
    let mobile: String
}

struct CostInfo {
    let deliveryCost: Int
    let discount: Discount
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

class ParcelInformation {
    var receiver: Receiver
    var costInfo: CostInfo
    
    init(receiver: Receiver, costInfo: CostInfo) {
        self.receiver = receiver
        self.costInfo = costInfo
    }
}

struct DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

class ParcelOrderProcessor: ParcelProcessorProtocol {
    private let parcelInformationPersistence: ParcelInformationPersistence
    
    init() {
        self.parcelInformationPersistence = DatabaseParcelInformationPersistence()
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        parcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
