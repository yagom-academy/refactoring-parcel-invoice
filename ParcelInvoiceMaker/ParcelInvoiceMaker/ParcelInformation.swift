//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/23/24.
//

import Foundation


struct ParcelInformation {
    private(set) var address: Address
    private(set) var deliveryCost: Cost
    private(set) var discountStrategy: DiscountStrategy
    
    private(set) var receiverInfomation: ReceiverInformation
    
    var discountedCost: Cost {
        discountStrategy.applyDiscount(deliveryCost: deliveryCost)
    }

    init(address: String,
         receiverName: String,
         receiverMobile: String,
         deliveryCost: Int,
         discountType: String) throws {
        self.address = try Address(address)
        self.deliveryCost = Cost(deliveryCost)
        self.discountStrategy = DiscountStrategyFactory.createStrategy(type: discountType)
        
        let name = try PersonName(receiverName)
        let mobile = try PhoneNumber(receiverMobile)
        self.receiverInfomation = ReceiverInformation(
            name: name,
            mobile: mobile
        )
    }
}

//MARK: Address
struct Address {
    private(set) var value: String
    
    init(_ address: String) throws {
        // 주소가 100자를 넘어간다면, Error
        guard address.count < 100 else {
            throw NSError() as Error
        }
        self.value = address
    }
}


//MARK: ReceiverInformation
struct ReceiverInformation {
    private(set) var name: PersonName
    private(set) var mobile: PhoneNumber
}

struct PersonName {
    private(set) var value: String
    
    init(_ name: String) throws {
        // 이름이 50자를 넘어간다면, Error
        guard name.count < 50 else {
            throw NSError() as Error
        }
        self.value = name
    }
}

struct PhoneNumber {
    private(set) var value: String
    
    init(_ phoneNumber: String) throws {
        // 전화번호가 15자보다 크다면, Error
        guard phoneNumber.count < 15 else {
            throw NSError() as Error
        }
        self.value = phoneNumber
    }
}

//MARK: Cost
struct Cost {
    private(set) var value: Int
    
    init(_ cost: Int) {
        // 비용이 마이너스라면 `0`으로 초기화
        guard cost >= 0 else {
            self.value = .zero
            return
        }
        self.value = cost
    }
}

//MARK: Discount
protocol DiscountStrategy {
    var discountType: String { get }
    func applyDiscount(deliveryCost: Cost) -> Cost
}

struct NoDiscount: DiscountStrategy {
    private(set) var discountType: String = "없음"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value)
    }
}

struct VIPDiscount: DiscountStrategy {
    private(set) var discountType: String = "VIP"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value / 5 * 4)
    }
}

struct CouponDiscount: DiscountStrategy {
    private(set) var discountType: String = "쿠폰"
    
    func applyDiscount(deliveryCost: Cost) -> Cost {
        Cost(deliveryCost.value / 2)
    }
}

struct DiscountStrategyFactory {
    private static var strategies: [DiscountStrategy] = [
        VIPDiscount(),
        CouponDiscount(),
        NoDiscount()
    ]

    static func createStrategy(type: String) -> DiscountStrategy {
        let discountStrategy = strategies.first(where: { $0.discountType == type })
        return discountStrategy ?? NoDiscount()
    }
}
