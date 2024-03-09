//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

struct ParcelInformation {
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

enum Discount: Int {
  case none = 0, vip, coupon
}
