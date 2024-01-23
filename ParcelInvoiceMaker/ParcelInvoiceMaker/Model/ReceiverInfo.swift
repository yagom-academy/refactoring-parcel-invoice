//
//  ReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct ReceiverInfo {
    var name: String
    var mobile: String
    let address: String
    
    init(name: String, mobile: String, address: String) {
        self.name = name
        self.mobile = mobile
        self.address = address
    }
}
