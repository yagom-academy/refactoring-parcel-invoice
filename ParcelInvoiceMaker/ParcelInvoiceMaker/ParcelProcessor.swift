//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

final class ParcelInformation {
  private let receiverInformation: ReceiverInformation
  private let deliveryCost: Int
  private let discount: Discount
  
  init(receiverInformation: ReceiverInformation, deliveryCost: Int, discount: Discount) {
    self.receiverInformation = receiverInformation
    self.deliveryCost = deliveryCost
    self.discount = discount
  }
  
  func getReceiverAddress() -> String {
    return receiverInformation.getAddress()
  }
  
  func getReceiverName() -> String {
    return receiverInformation.getName()
  }
  
  func getReceiverMobile() -> String {
    return receiverInformation.getMobile()
  }
  
  func getDiscountedCost() -> Int {
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

final class ReceiverInformation {
  private let address: String
  private let name: String
  private let mobile: String
  
  init(address: String, name: String, mobile: String) {
    self.address = address
    self.name = name
    self.mobile = mobile
  }
  
  func getAddress() -> String {
    return address
  }
  
  func getName() -> String {
    return name
  }
  
  func getMobile() -> String {
    return mobile
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
