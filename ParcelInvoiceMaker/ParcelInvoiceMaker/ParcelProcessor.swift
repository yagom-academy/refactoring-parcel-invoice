//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct UserInfo {
    let address: String
    let receiverName: String
    let receiverMobile: String
}

enum ReceiptType: Int {
    case sms = 0
    case email
    
    var title: String {
        switch self {
        case .sms:
            return "문자"
        case .email:
            return "이메일"
        }
    }
    
    func makeReceipt() {
        print("\(self.title)로 영수증 발송")
    }
}

// MARK: - ParcelInformation
class ParcelInformation {
    let userInfo: UserInfo
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        discount.strategy.applyDiscount(deliveryCost: deliveryCost)
    }
    let receiptTypes: [ReceiptType]

    init(userInfo: UserInfo, 
         deliveryCost: Int,
         discount: Discount,
         receiptTypes: [ReceiptType]
    ) {
        self.userInfo = userInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
        self.receiptTypes = receiptTypes
    }
}

enum Discount: Int {
    case none = 0, vip, coupon, vvip
    var strategy: DiscountStrategy {
        switch self {
        case .none:
            return NoDiscount()
        case .vip:
            return VIPDiscount()
        case .coupon:
            return CouponDiscount()
        case .vvip:
            return VVIPDiscouut()
        }
    }
}

// MARK: - (protocol)ParcelOrderProcessorPersistence
protocol ParcelOrderProcessorPersistence {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

// MARK: - ParcelOrderProcessor
class ParcelOrderProcessor {
 
    private let database: ParcelInformationPersistence
    
    init(database: ParcelInformationPersistence) {
        self.database = database
    }
}
    
// MARK: - ParcelOrderProcessorPersistence
extension ParcelOrderProcessor: ParcelOrderProcessorPersistence {
    
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        database.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
}

// MARK: - (protocol)ParcelInformationPersistence
protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}

// MARK: - DatabaseParcelInformationPersistence
class DatabaseParcelInformationPersistence {

}

// MARK: - ParcelInformationPersistence
extension DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
