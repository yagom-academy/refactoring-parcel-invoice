//
//  PhoneNumber.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/24/24.
//

import Foundation

struct PhoneNumber {
    private(set) var value: String
    
    init(value: String) throws {
        try Self.validate(value)
        self.value = value
    }
    
    private static func validate(_ value: String) throws {
        guard value.count == 11 else {
            throw DataError.invalideData
        }
    }
}
