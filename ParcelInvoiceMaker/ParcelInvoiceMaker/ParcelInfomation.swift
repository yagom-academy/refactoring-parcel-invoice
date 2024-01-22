//
//  ParcelInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/22/24.
//

import Foundation

protocol ParcelInformationProvider {
    func getAdress() -> String
    func getReceiverName() -> String
    func getReceiverMobile() -> String
    func getDiscountedCost() -> Int
}

class ParcelInformation: ParcelInformationProvider {
    private let parcelInfo: ParcelInfo

    init(parcelInfo: ParcelInfo) {
        self.parcelInfo = parcelInfo
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 주소를 반환합니다.
    func getAdress() -> String {
        return parcelInfo.address
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getReceiverName() -> String {
        return parcelInfo.getReceiverName()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 휴대폰번호를 반환합니다.
    func getReceiverMobile() -> String {
        return parcelInfo.getReceiverMobile()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 할인비용을 반환합니다.
    func getDiscountedCost() -> Int {
        return parcelInfo.cost.discountedCost
    }
}

struct ParcelInfo {
    let address: String
    let receiver: ReceiverInfo
    let cost: ParcelCost
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getReceiverName() -> String {
        receiver.receiverName
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 휴대폰을 반환합니다.
    func getReceiverMobile() -> String {
        receiver.receiverMobile
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 할인비용을 반환합니다.
    func getDiscountedCost() -> Int {
        return cost.discountedCost
    }
}

// 보내는사람 정보
struct ReceiverInfo {
    let receiverName: String
    let receiverMobile: String
}

// 소포 비용
struct ParcelCost {
    let deliveryCost: Double
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
            return Int(deliveryCost)
        case .vip:
            return Int(deliveryCost * DiscountRate.vip)
        case .coupon:
            return Int(deliveryCost * DiscountRate.coupon)
        }
    }
    
    init(deliveryCost: Double, discount: Discount) {
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

// 객체 미용 체조, 3원칙 매직넘버 사용x
// 할인비율
enum DiscountRate {
    static let vip = 0.8
    static let coupon = 0.5
}

// 할인 타입
enum Discount: Int {
    case none = 0, vip, coupon
}
