//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct ParcelInformation {
  private let receiverInformation: ReceiverInformation
  private let delivery: Delivery
  
  init(
    receiverInformation: ReceiverInformation,
    delivery: Delivery
  ) {
    self.receiverInformation = receiverInformation
    self.delivery = delivery
  }
}

extension ParcelInformation {
  func receiverName() -> String {
    receiverInformation.name()
  }
  
  func receiverMobile() -> String {
    receiverInformation.mobile()
  }
  
  func receiverAddress() -> String {
    receiverInformation.address()
  }
  
  func deliveryCost() -> Int {
    delivery.cost()
  }
}
