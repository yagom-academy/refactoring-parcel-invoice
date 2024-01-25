//
//  Name.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct Name {
    let value: String
    
    init(_ value: String) throws {
        let koreanNameRegex: String = "^[가-힣]{2,8}$"
        guard  value.range(of: koreanNameRegex, options: .regularExpression) != nil else { throw NSError() }
        self.value = value
    }
}
