//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import Foundation

protocol DiscountStrategy {
  func applyDiscount(deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Int) -> Int {
    return deliveryCost
  }
}

struct VIPDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Int) -> Int {
    return deliveryCost / 5 * 4
  }
}

struct CouponDiscount: DiscountStrategy {
  func applyDiscount(deliveryCost: Int) -> Int {
    return deliveryCost / 2
  }
}
