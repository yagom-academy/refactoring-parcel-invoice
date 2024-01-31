//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// STEP 1-1: 객체미용체조 7원칙 적용
// 궁금증 1: 원시값 포장을 하다보면 계속 깊이가 깊어져서 단순히 하나의 property를 읽는데도 객체미용체조 4원칙인 '한 줄에 한 점만 사용'을 어기게 되는데 이건 어떻게 해야하나요? 그때마다 getter와 setter등의 메서드로 따로 구현해야할까요?
class ParcelInformation {
    private let deliveryInfo: DeliveryInfo?
    private var costs: Costs?
    
    init(
        address: String,
        receiverName: String,
        receiverMobile: String,
        deliveryCost: Int,
        discount: Discount
    ) {
        self.deliveryInfo = try? DeliveryInfo(
            address: address,
            receiverName: receiverName,
            receiverMobile: receiverMobile
        )
        self.costs = try? Costs(
            discount: discount,
            deliveryCost: deliveryCost
        )
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
}

fileprivate struct DeliveryInfo {
    let address: String
    
    // 1-2 이렇게 또 묶을 수 있겠다
//        var recieverName: String
//        var receiverMobile: String
    var receiverInfo: ReceiverInfo
    
    init(
        address: String,
        receiverName: String,
        receiverMobile: String
    ) throws {
        guard address.isEmpty == false else {
            throw NSError() as Error
        }
        
        self.address = address
        self.receiverInfo = try ReceiverInfo(
            recieverName: receiverName,
            receiverMobile: receiverMobile
        )
    }
}

// 1-2-1 원시타입 포장
fileprivate struct ReceiverInfo {
    var recieverName: String
    var receiverMobile: String
    
    init(
        recieverName: String,
        receiverMobile: String
    ) throws {
        guard recieverName.isEmpty == false || receiverMobile.isEmpty == false else {
            throw NSError() as Error
        }
        self.recieverName = recieverName
        self.receiverMobile = receiverMobile
    }
}

// 2-1 셋 다 엮여있는데, 결국엔 discountedCost를 구하기 위한거 아닐까?
fileprivate struct Costs {
    private let discount: Discount
    let deliveryCost: Int
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
    
    init(
        discount: Discount,
        deliveryCost: Int
    ) throws {
        guard (0...Int.max).contains(deliveryCost) else {
            throw NSError() as Error
        }
        self.discount = discount
        self.deliveryCost = deliveryCost
    }
}

// 2. SOLID SRP 적용
class ParcelOrderProcessor {
    // 택배 주문 처리 로직
    // SOLID DIP 적용해서 변경
//    let databasePercelInformationPersistence: DatabaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
    let databasePercelInformationPersistence: ParcelInformationPersistence
    
    // ParcelOrderProcessor는 process 로직 하나만 처리
    func process(
        parcelInformation: ParcelInformation,
        onComplete: (ParcelInformation) -> Void
    ) {
        // 데이터베이스에 주문 저장 -> DatabaseParcelInformationPersistence 구조체를 만들어서 로직 이전
//        save(parcelInformation: parcelInformation)
        databasePercelInformationPersistence.save(parcelInformation: parcelInformation)
        onComplete(parcelInformation)
    }
    
    // init시에 인스턴스를 주입해줄 수 있게 수정
    init(databasePercelInformationPersistence: ParcelInformationPersistence) {
        self.databasePercelInformationPersistence = databasePercelInformationPersistence
    }
}

struct DatabaseParcelInformationPersistence: ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) {
        // 데이터베이스에 주문 정보 저장
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}


// 3. SOLID DIP 적용
// 현재 의존 관계 ParcelProcessor -> DatabaseParcelInformationPersistence
// 가운데에 프로토콜을 하나 생성해서 직접 소유를 하지 않고 init 시점에 persistence 인스턴스를 생성해 주입
protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation) // 프로토콜 안에는 메서드에 Body는 없어야하고 메서드를 가리키는 이름만 있어야함
}
