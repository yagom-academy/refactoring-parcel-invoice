//
//  DiscountCost.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

struct DiscountCost {
  private var _cost: Cost = .init(0)
  
  init(
    by discount: Discount,
    to cost: Cost
  ) {
    self._cost = calculateRate(
      by: discount,
      to: cost
    )
  }
}

extension DiscountCost {
  func cost() -> Int {
    _cost.value
  }
}

extension DiscountCost {
  private func calculateRate(
    by discount: Discount,
    to cost: Cost
  ) -> Cost {
    switch discount {
    case .none: return cost
    case .vip: return  Cost(cost.value / 5 * 4)
    case .coupon: return Cost(cost.value / 2)
    }
  }
}
