//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

struct Address {
    let value: String
    
    init(_ address: String) throws {
        // 주소가 100자를 넘어간다면, Error
        guard address.count < 100 else {
            throw NSError() as Error
        }
        self.value = address
    }
}

struct Cost {
    let value: Int
    
    init(_ cost: Int) {
        // 비용이 마이너스라면 `0`으로 초기화
        guard cost >= 0 else {
            self.value = .zero
            return
        }
        self.value = cost
    }
}

struct PersonName {
    let value: String
    
    init(_ name: String) throws {
        // 이름이 50자를 넘어간다면, Error
        guard name.count < 100 else {
            throw NSError() as Error
        }
        self.value = name
    }
}

struct PhoneNumber {
    let value: String
    
    init(_ phoneNumber: String) throws {
        // 전화번호가 15자를 넘어간다면, Error
        guard phoneNumber.count < 15 else {
            throw NSError() as Error
        }
        self.value = phoneNumber
    }
}

struct ReceiverInformation {
    let name: PersonName
    let mobile: PhoneNumber
}

enum Discount: Int {
    case none = 0, vip, coupon
}

class ParcelInformation {
    let address: Address
    let receiverInfomation: ReceiverInformation
    let deliveryCost: Cost
    
    private let discount: Discount
    
    var discountedCost: Cost {
        switch discount {
        case .none:
            return Cost(deliveryCost.value)
        case .vip:
            let deliveryFee = deliveryCost.value / 5 * 4
            return Cost(deliveryFee)
        case .coupon:
            let deliveryFee = deliveryCost.value / 2
            return Cost(deliveryFee)
        }
    }

    init(address: String,
         receiverName: String,
         receiverMobile: String,
         deliveryCost: Int,
         discount: Discount) throws {
        self.address = try Address(address)
        let name = try PersonName(receiverName)
        let mobile = try PhoneNumber(receiverMobile)
        self.receiverInfomation = ReceiverInformation(name: name, mobile: mobile)
        self.deliveryCost = Cost(deliveryCost)
        self.discount = discount
    }
}

//MARK: - ParcelInformationPersistence
protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    
    init() {
        
    }
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}



//MARK: - ParcelProcessing
protocol ParcelProcessing {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

class ParcelOrderProcessor: ParcelProcessing {
    
    let persistence: ParcelInformationPersistence
    
    init(parcelPersistence: ParcelInformationPersistence) {
        self.persistence = parcelPersistence
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        persistence.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
}
