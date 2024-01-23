//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct Cost {
    let value: Int
    
    init(value: Int) {
        self.value = value >= 0 ? value : 0
    }
}
