//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

struct Cost {
    private let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    func getValue() -> Int {
        return value
    }
}
