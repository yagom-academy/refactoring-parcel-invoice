//
//  ValueWrapper.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/24/24.
//

import Foundation
protocol ValueWrapper {
    associatedtype valueType
    var value: valueType { get }
}

extension ValueWrapper {
    func getValue() -> valueType {
        return value
    }
}
