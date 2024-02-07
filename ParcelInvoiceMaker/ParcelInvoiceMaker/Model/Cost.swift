//
//  Cost.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/24/24.
//

import Foundation


//MARK: Cost
struct Cost: CustomStringConvertible {
    private(set) var value: Int
    
    init(_ cost: Int) {
        // 비용이 마이너스라면 `0`으로 초기화
        guard cost >= 0 else {
            self.value = .zero
            return
        }
        self.value = cost
    }
    
    var description: String {
        "\(value)"
    }
}
