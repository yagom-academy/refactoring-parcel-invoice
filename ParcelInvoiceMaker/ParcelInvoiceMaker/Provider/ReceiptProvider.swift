//
//  ReceiptProvider.swift
//  ParcelInvoiceMaker
//
//  Created by MacBook on 2024/03/11.
//

import Foundation

protocol ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool
    func send(content: String) async
}

struct EmailReceiptProvider: ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool {
        method == .email
    }
    
    func send(content: String) async {
        Task {
            print("이메일 영수증 전송: \(content)")
        }
    }
}

struct SMSReceiptProvider: ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool {
        method == .sms
    }
    
    func send(content: String) async {
        Task {
            print("문자 영수증 전송: \(content)")
        }
    }
}

enum ReceiptProvideMethod: Int {
    case email, sms
}

struct ReceiptProvideInfo {
    private let receiptContent: String
    private let method: ReceiptProvideMethod
    private let providers: [ReceiptProvider]
    
    init(
        receiptContent: String,
        method: ReceiptProvideMethod,
        providers: [ReceiptProvider]
    ) {
        self.receiptContent = receiptContent
        self.method = method
        self.providers = providers
    }
    
    func sendReceipt() {
        Task {
            await providers
                .first { $0.canSend(method) }?
                .send(content: receiptContent)
        }
    }
}
