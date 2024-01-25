//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct ReceiverInformation {
  private var _address: Address
  private var reciver: Receiver
  
  init(
    address: Address,
    reciver: Receiver
  ) {
    self._address = address
    self.reciver = reciver
  }
}

extension ReceiverInformation {
  func address() -> String {
    _address.value
  }
  
  func name() -> String {
    reciver.name()
  }
  
  func mobile() -> String {
    reciver.mobile()
  }
}
