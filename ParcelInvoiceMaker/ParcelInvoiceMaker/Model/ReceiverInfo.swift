//
//  ReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct ReceiverInfo {
    private var name: PersonName
    private var mobile: PhoneNumber
    private(set) var address: Address
    
    init(name: String, mobile: String, address: String) throws {
        self.name = try PersonName(value: name)
        self.mobile = try PhoneNumber(value: mobile)
        self.address = try Address(value: address)
    }
    
    func getName() -> String {
        name.value
    }
    
    func getMobile() -> String {
        mobile.value
    }
}
