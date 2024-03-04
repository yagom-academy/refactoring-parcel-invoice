//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct MobileNumber {
    private let value: String
    
    init(value: String) {
        self.value = value
    }

    func getValue() -> String {
        return self.value
    }
}

struct Name {
    private let value: String
    
    init(value: String) {
        self.value = value
    }

    func getValue() -> String {
        return self.value
    }
}

struct ReceiverInformation {
    private let address: String
    private var name: Name
    private var mobileNumber: MobileNumber
    
    func getAddress() -> String {
        return self.address
    }
    
    func getReceiverName() -> String {
        return self.name.getValue()
    }
    
    func getReceiverMobile() -> String {
        return self.mobileNumber.getValue()
    }
    
    init(address: String, name: Name, mobileNumber: MobileNumber) {
        self.address = address
        self.name = name
        self.mobileNumber = mobileNumber
    }
}

final class ParcelInformation {
    private let receiverInformation: ReceiverInformation
    private let deliveryCost: Int
    private let discount: Discount

    init(receiverInformation: ReceiverInformation, 
         deliveryCost: Int, 
         discount: Discount)
    {
        self.receiverInformation = receiverInformation
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    func getReceiverName() -> String {
        return receiverInformation.getReceiverName()
    }
    
    func getReceiverAddress() -> String {
        return receiverInformation.getAddress()
    }
    
    func getReceiverMobile() -> String {
        return receiverInformation.getReceiverMobile()
    }
    
    func getDiscountedCost() -> Int {
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

final class DatabaseParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

final class ParcelOrderProcessor {
    private let persistence: DatabaseParcelInformationPersistence
    
    init(persistence: DatabaseParcelInformationPersistence) {
        self.persistence = persistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
