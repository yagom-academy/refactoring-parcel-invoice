//
//  ParcelInfo.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

struct ParcelInfo {
    let address: String
    let receiver: ReceiverInfo
    let cost: ParcelCost
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getReceiverName() -> String {
        receiver.getReceiverName()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 휴대폰을 반환합니다.
    func getReceiverMobile() -> String {
        receiver.getReceiverMobile()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 할인비용을 반환합니다.
    func getDiscountedCost() -> Int {
        return cost.getDiscountedCost()
    }
}
