//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// DiscountStrategy 프로토콜을 정의
protocol DiscountStrategy {
    var discountRate: Double { get }
    // 요구 메서드
    func applyDiscount(_ deliveryCost: Double) -> Int
}

// DiscountStrategy 프로토콜을 확장
extension DiscountStrategy {
    func applyDiscount(_ deliveryCost: Double) -> Int {
        return Int(deliveryCost * discountRate)
    }
}

struct NoDiscountStrategy: DiscountStrategy {
    var discountRate: Double
}

struct VIPDiscountStrategy: DiscountStrategy {
    var discountRate: Double
}

struct CouponDiscountStrategy: DiscountStrategy {
    var discountRate: Double
}

struct EventDiscountStrategy: DiscountStrategy {
    var discountRate: Double
}
