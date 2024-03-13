//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation


protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) 
}

class ParcelInformation {
    let address: String
    var receiverName: String
    var receiverMobile: String
    let deliveryCost: Int
    let discount: Discount
   
    init(address: String, receiverName: String, receiverMobile: String, deliveryCost: Int, discount: Discount) {
        self.address = address
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
            
    var strategy: DiscountStrategy {
        switch self {
        case .none:
            return NoDiscount()
        case .vip:
            return VIPDiscount()
        case .coupon:
            return CouponDiscount()
        }
    }
    
}


class ParcelOrderProcessor {
        
    let databaseParcelInformationPersistence: DatabaseParcelInformationPersistence?
    
    init(databaseParcelInformationPersistence: DatabaseParcelInformationPersistence? = nil) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence?.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
}

class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }

}
