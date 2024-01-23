//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// DiscountStrategy 프로토콜을 정의
protocol DiscountStrategy {
    // 요구 메서드
    func applyDiscount(_ deliveryCost: Double) -> Int
}

struct NoDiscountStrategy: DiscountStrategy {
    func applyDiscount(_ deliveryCost: Double) -> Int {
        return Int(deliveryCost)
    }
}

struct VIPDiscountStrategy: DiscountStrategy {
    func applyDiscount(_ deliveryCost: Double) -> Int {
        return Int(deliveryCost * DiscountRate.vip)
    }
}

struct CouponDiscountStrategy: DiscountStrategy {
    func applyDiscount(_ deliveryCost: Double) -> Int {
        return Int(deliveryCost * DiscountRate.coupon)
    }
}

// 할인 타입
enum Discount: Int {
    case none = 0, vip, coupon
    var strategy: DiscountStrategy {
        switch self {
        case .none:
            NoDiscountStrategy()
        case .vip:
            VIPDiscountStrategy()
        case .coupon:
            CouponDiscountStrategy()
        }
    }
}

// 객체 미용 체조, 3원칙 매직넘버 사용x
// 할인비율
enum DiscountRate {
    static let vip = 0.8
    static let coupon = 0.5
}
