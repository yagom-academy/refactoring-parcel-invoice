//
//  MobileNumber.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/26/24.
//

import Foundation

struct MobileNumber: ValueWrapper {
    var value: String
    
    private let predicate = NSPredicate(
        format: "SELF MATCHES %@", "^01[0-1, 7][0-9]{7,8}$")
    
    init(_ value: String) throws {
        guard predicate.evaluate(with: value) else {
            throw ParcelError.mobileNumber
        }
        self.value = value
    }
}
