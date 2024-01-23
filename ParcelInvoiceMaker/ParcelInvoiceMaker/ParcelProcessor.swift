//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let receiver: Receiver
    let charge: Charge
    
    init(receiver: Receiver, charge: Charge) {
        self.receiver = receiver
        self.charge = charge
    }
}

class Receiver {
    let address: String
    var receiverName: String
    var receiverMobile: String
    
    init(address: String, receiverName: String, receiverMobile: String) {
        self.address = address
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
    }
}

class Charge {
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

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

class ParcelOrderProcessor {
    
    let parcelInformationPersistence: ParcelInformationPersistence
    
    init(parcelInformationPersistence: ParcelInformationPersistence) {
        self.parcelInformationPersistence = parcelInformationPersistence
    }
    
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        parcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
