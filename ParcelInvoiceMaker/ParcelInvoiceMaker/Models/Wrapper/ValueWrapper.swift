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
    func getValue() -> valueType
}

extension ValueWrapper {
    func getValue() -> valueType {
        return value
    }
}

struct Cost: ValueWrapper {
    let value: Double
    init(_ value: Double) throws {
        guard value > 0 else {
            throw ParcelError.cost
        }
        self.value = value
    }
}

struct Mobile: ValueWrapper {
    var value: String
    
    private let predicate = NSPredicate(
        format: "SELF MATCHES %@", "^01[0-1, 7][0-9]{7,8}$")
    
    init(_ value: String) throws {
        guard predicate.evaluate(with: value) else {
            throw ParcelError.mobile
        }
        self.value = value
    }
}

struct Name: ValueWrapper {
    var value: String
    
    private let predicate = NSPredicate(
        format: "SELF MATCHES %@", "^[가-힣a-zA-Z]{1,10}$")
    
    init(_ value: String) throws {
        guard predicate.evaluate(with: value) else {
            throw ParcelError.name
        }
        self.value = value
    }
}
