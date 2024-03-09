//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

struct ReceiverInformation {
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
