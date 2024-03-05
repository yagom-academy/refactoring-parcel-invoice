//
//  ParcelCostInfo.swift
//  ParcelInvoiceMaker
//
//  Created by MacBook on 2024/03/04.
//

import Foundation

protocol ValidatedNumeric {
    associatedtype Numeric
    
    var value: Numeric { get set }
    
    static func isValid(_ value: Numeric) -> Bool
    init(value: Numeric) throws
}

struct ParcelDeliveryCost: ValidatedNumeric {
    var value: Int
    
    static func isValid(_ value: Int) -> Bool {
        value >= 0
    }
    
    init(value: Int) throws {
        if !Self.isValid(value) {
            throw ParcelError.costInvalid
        }
        self.value = value
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

struct ParcelCostInfo {
    let deliveryCost: ParcelDeliveryCost
    let discount: Discount
}
