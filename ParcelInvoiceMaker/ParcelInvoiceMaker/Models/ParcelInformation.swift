//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

struct ParcelInformation {
  let receiver: ReceiverInformation
  let deliveryCost: DeliveryCost
  
  init(receiver: ReceiverInformation, deliveryCost: DeliveryCost) {
    self.receiver = receiver
    self.deliveryCost = deliveryCost
  }
}
