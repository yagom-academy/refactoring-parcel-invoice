//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/24.
//

import Foundation

struct ReceiverInformation {
    let address: String
    let name: String
    let mobile: String
    
    init(address: String, name: String, mobile: String) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
}
