//
//  ReceiptProvider.swift
//  ParcelInvoiceMaker
//
//  Created by MacBook on 2024/03/11.
//

import Foundation

protocol ReceiptProvider {
    func send(content: String) async
}

struct EmailReceiptProvider: ReceiptProvider {
    func send(content: String) async {
        Task {
            print("이메일 영수증 전송: \(content)")
        }
    }
}

struct SMSReceiptProvider: ReceiptProvider {
    func send(content: String) async {
        Task {
            print("문자 영수증 전송: \(content)")
        }
    }
}
