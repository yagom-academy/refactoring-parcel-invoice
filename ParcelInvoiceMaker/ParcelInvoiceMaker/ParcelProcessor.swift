//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct ReceiverInfo {
    let address: String
    var name: String
    var mobile: MobileNumber
}

struct MobileNumber {
    let value: String
    init(value: String) throws {
        let mobileNumberRegex = #"^01[016789]\d{3,4}\d{4}$"#
        
        guard NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex).evaluate(with: value) == true else {
            throw NSError() as Error
        }
        self.value = value
    }
    
    static func valid(with number: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@",
                           #"^01[016789]\d{3,4}\d{4}$"#).evaluate(with: number)
    }
}

extension MobileNumber: CustomStringConvertible {
    var description: String {
        return value
    }
}

final class ParcelInformation {
    var receiverInfo: ReceiverInfo
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
}

enum Discount: Int {
    case none = 0, vip, coupon
}

protocol OrderProcessable {
    var persistence: ParcelInformationPersistence { get }
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

final class ParcelOrderProcessor: OrderProcessable {
    let persistence: ParcelInformationPersistence
    
    init(persistence: ParcelInformationPersistence) {
        self.persistence = persistence
    }
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}

protocol ParcelInformationPersistence: AnyObject {
    func save(parcelInformation: ParcelInformation)
}

extension ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    static let shared: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
}
