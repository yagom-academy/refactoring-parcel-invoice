//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

struct ParcelInformation {
    let receiverInformation : ReceiverInformation // 변하니까 var
    let deliveryCost: DeliveryCost //
    init(receiverInformation : ReceiverInformation, deliveryCost: Int , discount : Discount) {
        self.receiverInformation = receiverInformation
        let discountStrategy = discount.strategy
        self.deliveryCost = DeliveryCost(deliveryCost: deliveryCost, strategy: discountStrategy)
    }
}
/// private 과 var , let을 해줘야하는 기준이 헷갈린다. 처음 설정할때 말고 변할일 없으니까 let 이라고 생각
struct ReceiverInformation{
    let address : String
    let name : String
    let mobile : String
    init(address: String, name: String, mobile: String) {
        self.address = address
        self.name = name
        self.mobile = mobile
    }
}
//MARK: - Discount
struct DeliveryCost {
    let deliveryCost : Int
    var discountStrategy : DiscountStrategy
    var discountedCost : Int {
        return discountStrategy.applyDiscount(deliveryCost: deliveryCost)
    }
    init(deliveryCost: Int, strategy: DiscountStrategy) {
        self.deliveryCost = deliveryCost
        self.discountStrategy = strategy
    }
}
protocol DiscountStrategy {
    func applyDiscount(deliveryCost : Int) -> Int
}

final class NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost
    }
}
final class VIPDiscount : DiscountStrategy{
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 20
    }
}
final class CouponDiscount : DiscountStrategy{
    func applyDiscount(deliveryCost: Int) -> Int {
        return deliveryCost / 2
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
    var strategy : DiscountStrategy{
        switch self {
        case .none:
            return NoDiscount()
        case .vip:
            return VIPDiscount()
        case .coupon:
            return CouponDiscount()
        }
    }
}
//MARK: - 배송처리

protocol ParcelInformationPersistence {
    func save(parcelInformation : ParcelInformation, _ onComplete : (ParcelInformation) -> Void)

}
final class ParcelOrderProcessor {
    /// 이러면 접근할때 꼭 넣어야하는 값인지 어떻게 알지궁금
    var delegate : ParcelInformationPersistence

    init(delegate: ParcelInformationPersistence, parcelInformation: ParcelInformation? = nil) {
        self.delegate = DatabaseParcelInformationPersistence()
    }
    
    func process(parcelInformation : ParcelInformation){
        delegate.save(parcelInformation: parcelInformation, { _ in
            print("저장에 성공했습니다.")
        })
    }
}
final class DatabaseParcelInformationPersistence : ParcelInformationPersistence{
    /// 클로저를 사용하는 이유가 데이터베이스 저장에 실패했을 경우도 생각해서 하는건지 궁금
    func save(parcelInformation : ParcelInformation, _ onComplete : (ParcelInformation) -> Void){
        print("발송 정보를 데이터베이스에 저장했습니다.\(parcelInformation)")
        onComplete(parcelInformation)
    }
}
