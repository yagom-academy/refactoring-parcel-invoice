//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

enum Discount: Int {
  case none = 0, vip, coupon
  
  var strategy: DiscountStrategy {
    switch self {
    case .none: NoDiscount()
    case .vip: VIPDiscount()
    case .coupon: CouponDiscount()
    }
  }
}
