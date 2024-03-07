//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class ParcelInformation {
    let address: String
    var receiverName: String
    var receiverMobile: String
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
}

protocol ParcelOrderProcessable {
  func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessor: ParcelOrderProcessable {
  private let persistence: ParcelInformationPersistence
  
  init(persistence: ParcelInformationPersistence) {
    self.persistence = persistence
  }
  
  func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
    persistence.save(parcelInformation: parcelInformation)
    
    onComplete(parcelInformation)
  }
}

protocol ParcelInformationPersistence {
  func save(parcelInformation: ParcelInformation)
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
  func save(parcelInformation: ParcelInformation) {
    print("발송 정보를 데이터베이스에 저장했습니다.")
  }
}
