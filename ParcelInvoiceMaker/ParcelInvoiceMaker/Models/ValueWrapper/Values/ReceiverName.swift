//
//  ReceiverName.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/26/24.
//

import Foundation

struct ReceiverName: ValueWrapper {
    var value: String
    
    private let predicate = NSPredicate(
        format: "SELF MATCHES %@", "^[가-힣a-zA-Z]{1,10}$")
    
    init(_ value: String) throws {
        guard predicate.evaluate(with: value) else {
            throw ParcelError.ReceiverName
        }
        self.value = value
    }
}
