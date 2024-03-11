//
//  DeliveryCost.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import Foundation

struct DeliveryCost {
  private let cost: Int
  private let discount: Discount
  
  init(cost: Int, discount: Discount) {
    self.cost = cost
    self.discount = discount
  }
  
  func getDiscountedCost() -> Int {
    discount.strategy.applyDiscount(deliveryCost: cost)
  }
}
