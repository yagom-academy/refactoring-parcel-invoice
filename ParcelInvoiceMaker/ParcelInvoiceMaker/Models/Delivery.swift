//
//  Delivery.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct Delivery {
  private let discountCost: DiscountCost
  
  init(
    cost: Cost,
    discount: DiscountStrategy
  ) {
    self.discountCost = DiscountCost(
      by: discount,
      to: cost
    )
  }
}

extension Delivery {
  func cost() -> Int {
    discountCost.cost()
  }
}
