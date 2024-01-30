//
//  ReceiptSendStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by Tony Lim on 1/30/24.
//

import Foundation

protocol ReceiptSendStrategy {
    func sendReceipt()
}

// MARK: - EmailReceiptSendStrategy
struct EmailReceiptSendStrategy: ReceiptSendStrategy {
    func sendReceipt() {
        print("이메일로 영수증 발송")
    }
}

// MARK: - SMSReceiptSendStrategy
struct SMSReceiptSendStrategy: ReceiptSendStrategy {
    func sendReceipt() {
        print("문자(SMS)로 영수증 발송")
    }
}
