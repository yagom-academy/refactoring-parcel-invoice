//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct ReceiverInfo {
    let address: String
    var receiverName: String
    var receiverMobile: String
}

struct DeliveryCost {
    let cost: Int
    init(cost: Int) throws {
        guard cost > 0 else {
            throw NSError() as Error
        }
        self.cost = cost
    }
}

class ParcelInformation {
    var receiverInfo: ReceiverInfo
    let deliveryCost: DeliveryCost
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
                return deliveryCost.cost
        case .vip:
                return deliveryCost.cost / 5 * 4
        case .coupon:
                return deliveryCost.cost / 2
        }
    }

    init(receiverInfo: ReceiverInfo, deliveryCost: DeliveryCost, discount: Discount) {
        self.receiverInfo = receiverInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

class ParcelOrderProcessor {
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
