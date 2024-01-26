//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// MARK: - 수정 전 코드

//class ParcelInformation {
//    let address: String
//    var receiverName: String
//    var receiverMobile: String
//    let deliveryCost: Int
//    private let discount: Discount
//    var discountedCost: Int {
//        switch discount {
//        case .none:
//            return deliveryCost
//        case .vip:
//            return deliveryCost / 5 * 4
//        case .coupon:
//            return deliveryCost / 2
//        }
//    }
//
//    init(address: String, receiverName: String, receiverMobile: String, deliveryCost: Int, discount: Discount) {
//        self.address = address
//        self.receiverName = receiverName
//        self.receiverMobile = receiverMobile
//        self.deliveryCost = deliveryCost
//        self.discount = discount
//    }
//}

// MARK: - 수정 후 코드 (step 1)

//final class ParcelInformation {
//    struct User {
//        let address: String
//        let receiver: Receiver
//    }
//
//    struct Receiver {
//        let name: String
//        let mobile: String
//    }
//    
//    struct Cost {
//        let delivery: Int
//        let discountCategory: Discount
//        var discountedDelivery: Int {
//            switch discountCategory {
//            case .none:
//                return delivery
//            case .vip:
//                return delivery / 5 * 4
//            case .coupon:
//                return delivery / 2
//            }
//        }
//    }
//    
//    let user: User
//    let cost: Cost
//
//    init(user: User, cost: Cost) {
//        self.user = user
//        self.cost = cost
//    }
//}
//
//enum Discount: Int {
//    case none = 0, vip, coupon
//}

// MARK: - 수정 후 코드 (step 2)

//final class ParcelInformation {
//    struct User {
//        let address: String
//        let receiver: Receiver
//    }
//
//    struct Receiver {
//        let name: String
//        let mobile: String
//    }
//    
//    struct Cost {
//        let delivery: Int
//        let discountCategory: Discount
//        var discountedDelivery: Int {
//            return discountCategory.strategy.applyDiscount(deliveryCost: delivery)
//        }
//    }
//    
//    let user: User
//    let cost: Cost
//
//    init(user: User, cost: Cost) {
//        self.user = user
//        self.cost = cost
//    }
//}
//
//struct NoDiscount: DiscountStrategy {
//    func applyDiscount(deliveryCost: Int) -> Int {
//        return deliveryCost
//    }
//}
//
//struct VIPDiscount: DiscountStrategy {
//    func applyDiscount(deliveryCost: Int) -> Int {
//        return deliveryCost / 20
//    }
//}
//
//struct CouponDiscount: DiscountStrategy {
//    func applyDiscount(deliveryCost: Int) -> Int {
//        return deliveryCost / 2
//    }
//}
//
//protocol DiscountStrategy {
//    func applyDiscount(deliveryCost: Int) -> Int
//}
//
//enum Discount: Int {
//    case none = 0, vip, coupon
//    var strategy: DiscountStrategy {
//        switch self {
//        case .none:
//            return NoDiscount()
//        case .vip:
//            return VIPDiscount()
//        case .coupon:
//            return CouponDiscount()
//        }
//    }
//}

// MARK: - 수정 후 코드 (step 2 보완 (swtich 제거, 매직넘버 제거))

final class ParcelInformation {
    struct User {
        let address: String
        let receiver: Receiver
    }

    struct Receiver {
        let name: String
        let mobile: String
    }
    
    struct Cost {
        let delivery: Int
        let discountStrategies: [DiscountStrategy]
        let discountCategory: Discount
        var discountedDelivery: Int {
            return discountStrategies.filter { $0.canDiscount(category: discountCategory) }.first?.applyDiscount(deliveryCost: delivery) ?? 0
        }
        
        init(delivery: Int, discountStrategies: [DiscountStrategy], discountCategory: Discount) throws {
            self.delivery = delivery
            
            guard discountStrategies.contains(where: {$0.discountCategory == discountCategory}) else { throw NSError() as Error }
            self.discountStrategies = discountStrategies
            
            self.discountCategory = discountCategory
        }
    }
    
    let user: User
    let cost: Cost

    init(user: User, cost: Cost) {
        self.user = user
        self.cost = cost
    }
}

struct NoDiscount: DiscountStrategy {
    let discountCategory: Discount = .none
    
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost
    }
    
    func canDiscount(category: Discount) -> Bool {
        return category == .none
    }
}

struct VIPDiscount: DiscountStrategy {
    let discountCategory: Discount = .vip
    
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / DiscountAmount.vip
    }
    
    func canDiscount(category: Discount) -> Bool {
        return category == .vip
    }
}

struct CouponDiscount: DiscountStrategy {
    let discountCategory: Discount = .coupon
    
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / DiscountAmount.coupon
    }
    
    func canDiscount(category: Discount) -> Bool {
        return category == .coupon
    }
}

protocol DiscountStrategy {
    var discountCategory: Discount { get }
    func applyDiscount(deliveryCost: Int) -> Int
    func canDiscount(category: Discount) -> Bool
}

enum Discount: Int {
    case none = 0, vip, coupon
}

enum DiscountAmount {
    static let vip: Int = 20
    static let coupon: Int = 2
}

// MARK: - 수정 전 코드

//class ParcelOrderProcessor {
//    
//    // 택배 주문 처리 로직
//    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
//        
//        // 데이터베이스에 주문 저장
//        save(parcelInformation: parcelInformation)
//        
//        onComplete(parcelInformation)
//    }
//    
//    func save(parcelInformation: ParcelInformation) {
//        // 데이터베이스에 주문 정보 저장
//        print("발송 정보를 데이터베이스에 저장했습니다.")
//    }
//}

// MARK: - 수정 후 코드 (step 1)

class ParcelOrderProcessor: ParcelOrderPersistable {
    
    private let parcelInformationSaver: ParcelInformationPersistable
    
    init(parcelInformationSaver: ParcelInformationPersistable = DatabaseParcelInformationPersistence()) {
        self.parcelInformationSaver = parcelInformationSaver
    }
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        parcelInformationSaver.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}

struct DatabaseParcelInformationPersistence: ParcelInformationPersistable {
    
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}

protocol ParcelInformationPersistable {
    func save(parcelInformation: ParcelInformation)
}

protocol ParcelOrderPersistable {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}
