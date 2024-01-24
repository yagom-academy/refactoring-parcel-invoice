//
//  Receipt.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/24/24.
//

import Foundation


protocol ReceiptDipatchStrategy {
    var receiptType: String { get }
    
    func sendReceipt()
}

struct EmailReceiptDipatcher: ReceiptDipatchStrategy {
    private(set) var receiptType: String = "이메일"
    
    func sendReceipt() {
        print("이메일로 영수증을 전송했습니다.")
    }
}

struct MessageReceiptDipatcher: ReceiptDipatchStrategy {
    private(set) var receiptType: String = "문자"
    
    func sendReceipt() {
        print("메세지로 영수증을 전송했습니다.")
    }
}

struct ReceiptStrategyFactory {
    private static var strategies: [ReceiptDipatchStrategy] = [
        EmailReceiptDipatcher(),
        MessageReceiptDipatcher()
    ]

    static func createStrategy(type: String) throws -> ReceiptDipatchStrategy {
        let receiptStrategy = strategies.first(where: { $0.receiptType == type })
        
        guard let receiptStrategy else {
            throw NSError() as Error
        }
        
        return receiptStrategy
    }
}
