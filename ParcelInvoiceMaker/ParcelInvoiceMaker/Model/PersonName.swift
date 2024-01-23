//
//  PersonName.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/24/24.
//

import Foundation

struct PersonName {
    private(set) var value: String
    
    init(value: String) throws {
        try Self.validate(value)
        self.value = value
    }
        
    private static func validate(_ value: String) throws {
        guard value.count > 2 else {
            throw DataError.invalideData
        }
    }
}
