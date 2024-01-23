//
//  Receiver.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct Receiver {
  private let _name: Name
  private let _mobile: Mobile
  
  init(
    name: Name,
    mobile: Mobile
  ) {
    self._name = name
    self._mobile = mobile
  }
}

extension Receiver {
  func name() -> String {
    _name.value
  }
  
  func mobile() -> String {
    _mobile.value
  }
}
