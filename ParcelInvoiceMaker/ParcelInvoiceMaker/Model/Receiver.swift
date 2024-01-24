//
//  Receiver.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

struct Address {
    private let value: String
    
    init(value: String) throws {
        try BusinessLogic.validateName(value)
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Name {
    private let value: String
    
    init(value: String) throws {
        try BusinessLogic.validateName(value)
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Mobile {
    private let value: String
    
    init(value: String) throws {
        try BusinessLogic.validateMobile(value)
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Receiver {
    private let address: Address
    private let name: Name
    private let mobile: Mobile
    
    func getAddress() -> String {
        return address.getValue()
    }
    
    func getName() -> String {
        return name.getValue()
    }
    
    func getMobile() -> String {
        return mobile.getValue()
    }
}
