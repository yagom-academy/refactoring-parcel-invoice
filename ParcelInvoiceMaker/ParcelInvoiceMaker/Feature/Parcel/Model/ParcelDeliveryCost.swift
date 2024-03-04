//
//  ParcelDeliveryCost.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

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
