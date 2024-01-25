//
//  DeliveryCost.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct DeliveryCost {
    let value: Int
    
    init(_ value: Int) throws {
        guard value >= 0 else { throw NSError() }
        self.value = value
    }
}
