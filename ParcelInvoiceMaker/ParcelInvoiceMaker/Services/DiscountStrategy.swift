//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

protocol DiscountStrategy {
  func applyDiscount(deliveryCost: Cost) -> Cost
}
