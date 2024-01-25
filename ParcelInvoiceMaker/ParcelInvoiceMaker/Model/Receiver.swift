//
//  Receiver.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

struct Address {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Name {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}

struct Mobile {
    private let value: String
    
    init(value: String) {
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
    
    init(address: Address, name: Name, mobile: Mobile) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
    
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
