//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Receipt {
    static let emailTitle: String = "이메일"
    static let smsTitle: String = "문자"
}

protocol OrderProcessable {
    var persistence: ParcelInformationPersistence { get }
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
    func sendRecipt(parcelInformation: ParcelInformation)
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
    
    // 택배 주문 처리 완료 후 영수증 전송
    func sendRecipt(parcelInformation: ParcelInformation) {
        persistence.sendReceipt(parcelInformation: parcelInformation)
    }
}

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
    func sendReceipt(parcelInformation: ParcelInformation)
}

extension ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print(PersistenceMessage.saveParcelInformation)
    }
    
    func sendReceipt(parcelInformation: ParcelInformation) {
        // 영수증 발송
        print(PersistenceMessage.sendReceipt)
    }
}

final class DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    static let shared: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
}

struct PersistenceMessage {
    static let saveParcelInformation: String = "발송 정보를 데이터베이스에 저장했습니다."
    static let sendReceipt: String = "영수증을 발송했습니다."
}
