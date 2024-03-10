//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import Foundation

enum Discount: Int {
  case none = 0, vip, coupon
  
  var strategy: DiscountStrategy {
    switch self {
    case .none:
      NoDiscount()
    case .vip:
      VIPDiscount()
    case .coupon:
      CouponDiscount()
    }
  }
}
