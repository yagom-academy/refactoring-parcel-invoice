//
//  NoDiscount.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct NoDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Cost) -> Cost {
    deliveryCost
  }
}
