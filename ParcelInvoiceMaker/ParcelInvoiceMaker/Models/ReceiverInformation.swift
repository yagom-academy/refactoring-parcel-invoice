//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/5/24.
//

import Foundation

struct ReceiverInformation {
    let address: Address
    let receiverName: Name
    let receiverMobile: Mobile
}

struct Address {
    private let address: String
    
    init?(address: String) {
        let pattern = "^[가-힣a-zA-Z0-9()\\s]+$"
        guard let _ = address.range(of: pattern, options: .regularExpression) else {
            return nil
        }
        self.address = address
    }
    
    func getValue() -> String {
        return self.address
    }
}

struct Name {
    private let name: String
    
    init?(name: String) {
        let pattern = "^[가-힣a-zA-Z\\s]+$"
        guard let _ = name.range(of: pattern, options: .regularExpression) else {
            return nil
        }
        
        self.name = name
    }
    
    func getValue() -> String {
        return self.name
    }
}

struct Mobile {
    private let mobile: String
    
    init?(mobile: String) {
        let pattern = "^[0-9]+$"
        guard let _ = mobile.range(of: pattern, options: .regularExpression) else {
            return nil
        }
        self.mobile = mobile
    }
    
    func getValue() -> String {
        return self.mobile
    }
}
