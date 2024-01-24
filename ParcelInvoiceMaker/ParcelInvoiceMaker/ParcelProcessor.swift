//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

/**
 * 1. 객체미용체조 7원칙 '2개 이상의 원시타입 프로퍼티를 갖는 타입 금지'를 지켜보려고 했지만...
 *    연관된 데이터라면 이름과 연락처 2개 + @(주소) 까지는 괜찮지 않을까해서 따로 묶어보았어요
 */
struct UserInfo {
    let address: String
    let receiverName: String
    let receiverMobile: String
}

// MARK: - ParcelInformation
class ParcelInformation {
    /** 1.를 처리하기 위해 유저정보를 묶었다.
     let address: String
     var receiverName: String
     var receiverMobile: String
     */
    let userInfo: UserInfo
    let deliveryCost: Int
    private let discount: Discount
    var discountedCost: Int {
        switch discount {
        case .none:
            return deliveryCost
        case .vip:
            return deliveryCost / 5 * 4
        case .coupon:
            return deliveryCost / 2
        }
    }

    /** 1.를 처리하기 위해 유저정보를 묶었다.
    init(address: String, receiverName: String, receiverMobile: String, deliveryCost: Int, discount: Discount) {
        self.address = address
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
     */
    init(userInfo: UserInfo, deliveryCost: Int, discount: Discount) {
        self.userInfo = userInfo
        self.deliveryCost = deliveryCost
        self.discount = discount
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

/**
 * 3. `ParcelOrderProcessor`타입은 데이터베이스 저장 일을 덜어냈지만,
 *    프로퍼티로 `DatabaseParcelInformationPersistence`를 직접 소유하고 있음으로 인해 의존성을 가지고 있습니다.
 *
 * 1) `ParcelOrderProcessor`와 `DatabaseParcelInformationPersistence`의 의존성을 분리해주기 위해
 *  i) `ParcelInformationPersistence` 프로토콜을 정의해주고
 *  ii)`DatabaseParcelInformationPersistence`가 `ParcelInformationPersistence` 프로토콜을 따르도록 합니다
 *
 * 2) 그 후 `ParcelOrderProcessor`가 `DatabaseParcelInformationPersistence`를 직접 소유하는 대신에,
 *  i)  `ParcelInformationPersistence`을 소유하도록 변경하고,
 *  ii) `ParcelOrderProcessor`의 init 시점에 `DatabaseParcelInformationPersistence` 인스턴스를 생성해 주입해주도록 합니다.
 
 */

// 얘도 `ParcelInformationPersistence`처럼 ParcelOrderProcessor를 직접 소유하지 않게 할 수 있지 않을까?
protocol ParcelOrderProcessorPersistence {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}

// MARK: - ParcelOrderProcessor
class ParcelOrderProcessor {
    /**
     * 2. SOLID SRP 적용해보기. w/ HINT
     * `ParcelOrderProcessor`타입은 여러일을 해내고 있다.
     * 데이터 베이스에 저장하는 기능은 다른 타입이 해주는 것이 좋을 것 같다.
     * 1) `DatabaseParcelInformationPersistence`타입을 만들어 기능을 분리해 보자.
     * 2) `DatabaseParcelInformationPersistence`가 `ParcelOrderProcessor`의 프로퍼티가 되고,
     * 3) `ParcelOrderProcessor`는 process 중에 `DataBaseParcelInformationPersistence`에게 저장을 요청한다.
     */
    
    // 2.를 처리하며 프로퍼티를 직접 소유하게 되어버림
    //private let database: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
    // 3. 2) i) `ParcelInformationPersistence`(protocol)을 소유한다.
    private let database: ParcelInformationPersistence
    
    // 3. 2) ii) `ParcelOrderProcessor`의 init 시점에
    init() {
        //`DatabaseParcelInformationPersistence` 인스턴스를 생성해 주입해주도록 합니다.
        self.database = DatabaseParcelInformationPersistence()
        
    }
}
    
extension ParcelOrderProcessor: ParcelOrderProcessorPersistence {
    
    // 택배 주문 처리 로직
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        
        // 데이터베이스에 주문 저장
        //save(parcelInformation: parcelInformation)
        database.save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
    /*
     * 1. 데이터 베이스에 저장하는 기능 -> DatabaseParcelInformationPersistence로 이동
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
     */
}

// 3. 1). i) ParcelInformationPersistence 프로토콜 지정
protocol ParcelInformationPersistence {
    // 3. 2) ii)를 진행하고나서 추가한 함수.
    func save(parcelInformation: ParcelInformation)
}

// MARK: - DatabaseParcelInformationPersistence
class DatabaseParcelInformationPersistence {
    /** `ParcelInformationPersistence`를 따르기 위해 해당 extension으로 이동.
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
    */
}

// 3. 1). ii) DatabaseParcelInformationPersistence`가 `ParcelInformationPersistence` 프로토콜을 따르도록 합니다
extension DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
