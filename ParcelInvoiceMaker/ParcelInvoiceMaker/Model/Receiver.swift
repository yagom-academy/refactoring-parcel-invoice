//
//  Receiver.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

typealias Address = String
typealias Name = String
typealias Mobile = String

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
        return address
    }
    
    func getName() -> String {
        return name
    }
    
    func getMobile() -> String {
        return mobile
    }
}
