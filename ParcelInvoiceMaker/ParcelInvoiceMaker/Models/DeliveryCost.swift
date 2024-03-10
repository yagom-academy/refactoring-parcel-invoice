//
//  DeliveryCost.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import Foundation

enum Discount: Int {
  case none = 0, vip, coupon
}

struct DeliveryCost {
  private let cost: Int
  private let discount: Discount
  
  init(cost: Int, discount: Discount) {
    self.cost = cost
    self.discount = discount
  }
  
  func getDiscountedCost() -> Int {
    switch discount {
    case .none:
      return cost
    case .vip:
      return cost / 5 * 4
    case .coupon:
      return cost / 2
    }
  }
}
