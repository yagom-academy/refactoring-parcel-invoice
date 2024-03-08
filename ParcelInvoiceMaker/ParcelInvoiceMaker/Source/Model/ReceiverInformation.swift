//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation

struct Name {
    private let _value: String
    
    init(value: String) {
        self._value = value
    }
    
    var value: String {
        return self._value
    }
}

struct MobileNumber {
    private let _value: String
    
    init(value: String) {
        self._value = value
    }
    
    var value: String {
        return self._value
    }
}

struct ReceiverInformation {
    private let _address: String
    private let _name: Name
    private let _mobileNumber: MobileNumber
    
    var address: String {
        return _address
    }
    
    var name: String {
        return _name.value
    }
    
    var mobileNumber: String {
        return _mobileNumber.value
    }
    
    init(address: String,
         name: Name,
         mobileNumber: MobileNumber) {
        self._address = address
        self._name = name
        self._mobileNumber = mobileNumber
    }
}
