//
//  Address.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/24/24.
//

import Foundation


//MARK: Address
struct Address: CustomStringConvertible {
    private(set) var value: String
    
    init(_ address: String) throws {
        // 주소가 100자를 넘어간다면, Error
        guard address.count < 100 else {
            throw NSError() as Error
        }
        self.value = address
    }
    
    var description: String {
        value
    }
}
