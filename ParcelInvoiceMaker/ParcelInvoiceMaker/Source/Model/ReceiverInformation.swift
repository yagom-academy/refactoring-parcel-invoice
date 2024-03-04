//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation

struct Name {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    func getValue() -> String {
        return self.value
    }
}

struct MobileNumber {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    func getValue() -> String {
        return self.value
    }
}

struct ReceiverInformation {
    private let address: String
    private let name: Name
    private let mobileNumber: MobileNumber
    
    func getAddress() -> String {
        return self.address
    }
    
    func getReceiverName() -> String {
        return self.name.getValue()
    }
    
    func getReceiverMobile() -> String {
        return self.mobileNumber.getValue()
    }
    
    init(address: String,
         name: Name,
         mobileNumber: MobileNumber)
    {
        self.address = address
        self.name = name
        self.mobileNumber = mobileNumber
    }
}
