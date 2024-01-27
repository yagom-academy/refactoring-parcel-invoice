//
//  CouponDiscount.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct CouponDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Cost) -> Cost {
    let cost = deliveryCost.value / 2
    return Cost(cost)
  }
}
