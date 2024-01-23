//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct Cost {
    private(set) var value: Int
    
    init(value: Int) {
        self.value = value >= CostNumber.freeCost ? value : CostNumber.freeCost
    }
}

enum CostNumber {
    static let freeCost: Int = 0
}
