//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/5/24.
//

import Foundation

struct ReceiverInformation {
    var address: Address
    var receiverName: Name
    var receiverMobile: Mobile
}

struct Address {
    private let address: String
    
    init(address: String) {
        self.address = address
    }
    
    func getValue() -> String {
        return self.address
    }
}

struct Name {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getValue() -> String {
        return self.name
    }
}

struct Mobile {
    private let mobile: String
    
    init(mobile: String) {
        self.mobile = mobile
    }
    
    func getValue() -> String {
        return self.mobile
    }
}
