//
//  PhoneNumber.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct PhoneNumber {
    let value: String
    
    init(_ value: String) throws {
        let koreanPhoneNumberRegex: String = "^\\d{2,3}-?\\d{3,4}-?\\d{4}$"
        guard  value.range(of: koreanPhoneNumberRegex, options: .regularExpression) != nil else { throw NSError() }
        self.value = value
    }
}
