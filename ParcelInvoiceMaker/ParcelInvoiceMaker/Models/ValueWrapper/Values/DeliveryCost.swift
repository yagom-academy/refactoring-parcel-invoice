//
//  DeliveryCost.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/26/24.
//

import Foundation

struct DeliveryCost: ValueWrapper {
    let value: Double
    init(_ value: Double) throws {
        guard value > 0 else {
            throw ParcelError.DeliveryCost
        }
        self.value = value
    }
}
