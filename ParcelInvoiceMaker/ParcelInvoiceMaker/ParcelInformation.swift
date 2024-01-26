//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 강동영 on 1/26/24.
//

import Foundation

final class ParcelInformation {
    private var receiverInfo: ReceiverInfo
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }

    init(receiverInfo: ReceiverInfo, deliveryCost: Int, discount: Discount) {
        self.receiverInfo = receiverInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    func getReceiverAddress() -> String {
        return receiverInfo.getAddress()
    }
    
    func getReceiverName() -> String {
        return receiverInfo.getName()
    }
    
    func getReceiverMobile() -> String {
        return receiverInfo.getMobile().description
    }
}

struct ReceiverInfo {
    private let address: String
    private var name: String
    private var mobile: MobileNumber
    
    init(address: String, name: String, mobile: MobileNumber) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
    
    func getAddress() -> String {
        return address
    }
    
    func getName() -> String {
        return name
    }
    
    func getMobile() -> MobileNumber {
        return mobile
    }
}

struct MobileNumber: CustomStringConvertible {
    private let value: String
    init(value: String) throws {
        guard Self.valid(with: value) == true else {
            throw NSError() as Error
        }
        self.value = value
    }
    
    static func valid(with number: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@",
                           #"^01[016789]\d{3,4}\d{4}$"#).evaluate(with: number)
    }
    
    var description: String {
        return value
    }
}
