//
//  Discount.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// 할인 타입
enum Discount: Int {
    case none = 0, vip, coupon
}

// 객체 미용 체조, 3원칙 매직넘버 사용x
// 할인비율
enum DiscountRate {
    static let vip = 0.8
    static let coupon = 0.5
}
