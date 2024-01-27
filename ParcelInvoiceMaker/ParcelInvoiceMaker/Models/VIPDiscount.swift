//
//  VIPDiscount.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct VIPDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Cost) -> Cost {
    let cost = deliveryCost.value / 5 * 4
    return Cost(cost)
  }
}
