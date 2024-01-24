//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by kodirbek on 1/24/24.
//

import Foundation

enum Discount: Int {
    case none = 0, vip, coupon
}

struct ReceiverInfo {
    let address: String
    let receiverName: String
    let receiverMobile: String
}

struct DeliveryCost {
    private var cost: Int
    
    private static func validate(_ cost: Int) throws {
        guard cost > 0 else {
            throw NSError() as Error
        }
    }
    
    init(_ cost: Int) throws {
        try Self.validate(cost)
        self.cost = cost
    }
    
    func getCost() -> Int {
        cost
    }
}

struct DiscountedCost {
    static let fiftyPerDiscount: Double = 0.5
    static let twentyPerDiscount: Double = 0.8
    
    static func getDiscountedCost(deliveryCost: DeliveryCost, discount: Discount) -> Int {
        switch discount {
            case .none:
                return deliveryCost.getCost()
            case .vip:
                return Int(Double(deliveryCost.getCost()) * twentyPerDiscount)
            case .coupon:
                return Int(Double(deliveryCost.getCost()) * fiftyPerDiscount)
        }
    }
}


class ParcelInformation {
    private let receiverInfo: ReceiverInfo
    private let deliveryCost: DeliveryCost
    private let discount: Discount
    
    private var discountedCost: Int {
        DiscountedCost.getDiscountedCost(deliveryCost: deliveryCost, discount: discount)
    }
    
    init(receiverInfo: ReceiverInfo, deliveryCost: DeliveryCost, discount: Discount) {
        self.receiverInfo = receiverInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
    
    // InvoiceView 안에선 '4원칙: 한 줄에 한 점만 사용'을 지키기 위해서 함수 추가
    func getReceiverName() -> String {
        receiverInfo.receiverName
    }
    
    func getReceiverAddress() -> String {
        receiverInfo.address
    }
    
    func getReceiverMobile() -> String {
        receiverInfo.receiverMobile
    }
    
    func getDiscountedCost() -> Int {
        discountedCost
    }
    
}


