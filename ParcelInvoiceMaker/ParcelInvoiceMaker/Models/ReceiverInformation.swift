//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

struct ReceiverInformation {
  let address: String
  let name: String
  let mobile: String
  
  init(address: String, name: String, mobile: String) {
    self.address = address
    self.name = name
    self.mobile = mobile
  }
}
