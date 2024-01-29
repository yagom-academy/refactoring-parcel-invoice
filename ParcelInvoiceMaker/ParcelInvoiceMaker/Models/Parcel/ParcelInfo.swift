//
//  ParcelInfo.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

struct ParcelInfo {
    private let address: String
    private let receiver: ReceiverInfo
    private let cost: ParcelCost
    private let receipt: Receipt
    
    init(address: String, receiver: ReceiverInfo, cost: ParcelCost, receipt: Receipt) {
        self.address = address
        self.receiver = receiver
        self.cost = cost
        self.receipt = receipt
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getAddress() -> String {
        return address
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getReceiverName() -> String {
        return receiver.getReceiverName()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 휴대폰을 반환합니다.
    func getReceiverMobile() -> String {
        return receiver.getReceiverMobile()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 할인비용을 반환합니다.
    func getDiscountedCost() -> Int {
        return cost.getDiscountedCost()
    }
    
    func getReceiptSendMethod() -> String {
        return receipt.method
    }
}
