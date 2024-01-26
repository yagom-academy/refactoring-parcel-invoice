//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by kodirbek on 1/24/24.
//

import Foundation

// MARK: - Discount Strategies

enum Discount: Int {
    case none = 0, vip, coupon, holiday
}

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: DeliveryCost) -> Int
    func canAccept(discount: Discount) -> Bool
}

struct NoDiscount: DiscountStrategy {
    private var noDiscount: Double = 1
    func applyDiscount(deliveryCost: DeliveryCost) -> Int {
        Int(deliveryCost.getCost())
    }
    func canAccept(discount: Discount) -> Bool {
        return discount == .none
    }
}

struct VIPDiscount: DiscountStrategy {
    private let twentyPerDiscount: Double = 0.8
    func applyDiscount(deliveryCost: DeliveryCost) -> Int {
        Int(deliveryCost.getCost() * twentyPerDiscount)
    }
    func canAccept(discount: Discount) -> Bool {
        return discount == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    private let fiftyPerDiscount: Double = 0.5
    func applyDiscount(deliveryCost: DeliveryCost) -> Int {
        Int(deliveryCost.getCost() * fiftyPerDiscount)
    }
    func canAccept(discount: Discount) -> Bool {
        return discount == .coupon
    }
}

// 이 새로운 전략은 테스트로 추가되었습니다.
struct HolidayDiscount: DiscountStrategy {
    private let fifteenPerDiscount: Double = 0.85
    func applyDiscount(deliveryCost: DeliveryCost) -> Int {
        Int(Double(deliveryCost.getCost()) * fifteenPerDiscount)
    }
    func canAccept(discount: Discount) -> Bool {
        return discount == .holiday
    }
}


// MARK: - Delivery Cost

// cost가 음수 또는 0이 아닌지 확인하기 위해 init()에서 배송 비용을 검증합니다.
struct DeliveryCost {
    private var cost: Double
    
    private static func validate(_ cost: Double) throws {
        guard cost > 0 else {
            throw NSError() as Error
        }
    }
    
    init(_ cost: Double) throws {
        try Self.validate(cost)
        self.cost = cost
    }
    
    func getCost() -> Double {
        cost
    }
}


// MARK: - Parcel Information
struct Address {
    private let address: String
    
    init(_ address: String) {
        self.address = address
    }
    
    func getAddress() -> String {
        return address
    }
}


struct ReceiverInfo {
    private let name: String
    private let mobile: String
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
    
    func getName() -> String{
        return name
    }
    
    func getMobile() -> String {
        return mobile
    }
    
}

// 원칙 2 'else 사용 금지'에서 볼 수 있듯이 여기에서는 전략 패턴을 사용했습니다. DiscountedCost와 ParcelInformation를 변경하지 않고도 쉽게 할인 유형을 확장할 수 있다는 장점이 있습니다. 테스트로 "HolidayDiscount"라는 새로운 유형의 할인 정책을 추가했습니다. 디스카운트 전략(DiscountStrategy) 프로토콜을 준수하는 새로운 HolidayDiscount 구조체를 생성했고, Discount 열거형에 새로운 'holiday' 케이스를 추가했고, 마지막으로 ParcelOrderView의 currentDiscountStrategies 배열에 새로운 전략을 추가하는 것만으로만 충분했습니다. 여기서 OCP를 따르는 것의 장점을 느꼈습니다.
struct DiscountedCost {
    private let deliveryCost: DeliveryCost
    private let discount: Discount
    private let discountStrategies: [DiscountStrategy]
    
    init(deliveryCost: DeliveryCost, discount: Discount, discountStrategies: [DiscountStrategy]) {
        self.deliveryCost = deliveryCost
        self.discount = discount
        self.discountStrategies = discountStrategies
    }
    
    private var discountedCost: Int {
        discountStrategies.filter {$0.canAccept(discount: discount)}
            .first?
            .applyDiscount(deliveryCost: deliveryCost) ?? 0
    }
    
    func getDiscountedCost() -> Int {
        discountedCost
    }
}


struct ParcelInformation {
    private let address: Address
    private let receiverInfo: ReceiverInfo
    private let discountedCost: DiscountedCost
    
    init(address: Address, receiverInfo: ReceiverInfo, discountedCost: DiscountedCost) {
        self.address = address
        self.receiverInfo = receiverInfo
        self.discountedCost = discountedCost
    }
    
    // InvoiceView 안에선 '4원칙: 한 줄에 한 점만 사용'을 지키기 위해서 함수 추가
    func getReceiverName() -> String {
        receiverInfo.getName()
    }
    
    func getReceiverAddress() -> String {
        address.getAddress()
    }
    
    func getReceiverMobile() -> String {
        receiverInfo.getMobile()
    }
    
    func getDiscountedCost() -> Int {
        discountedCost.getDiscountedCost()
    }
    
}


