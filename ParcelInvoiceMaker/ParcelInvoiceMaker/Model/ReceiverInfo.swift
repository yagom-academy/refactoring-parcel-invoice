//
//  ReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/23/24.
//

import Foundation

struct ReceiverInfo {
    private(set) var name: String
    private(set) var mobile: String
    private(set) var address: String
    
    init(name: String, mobile: String, address: String) {
        self.name = name
        self.mobile = mobile
        self.address = address
    }
}
