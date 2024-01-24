//
//  ReceiverInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/24/24.
//

import Foundation


//MARK: ReceiverInformation
struct ReceiverInformation {
    private(set) var name: PersonName
    private(set) var mobile: PhoneNumber
}

struct PersonName: CustomStringConvertible {
    private(set) var value: String
    
    init(_ name: String) throws {
        // 이름이 50자를 넘어간다면, Error
        guard name.count < 50 else {
            throw NSError() as Error
        }
        self.value = name
    }
    
    var description: String {
        value
    }
}

struct PhoneNumber: CustomStringConvertible {
    private(set) var value: String
    
    init(_ phoneNumber: String) throws {
        // 전화번호가 15자보다 크다면, Error
        guard phoneNumber.count < 15 else {
            throw NSError() as Error
        }
        self.value = phoneNumber
    }
    
    var description: String {
        value
    }
}
