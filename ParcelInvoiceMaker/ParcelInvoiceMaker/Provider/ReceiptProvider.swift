//
//  ReceiptProvider.swift
//  ParcelInvoiceMaker
//
//  Created by MacBook on 2024/03/11.
//

import Foundation
import Combine

enum ReceiptProviderError: Error {
    case noValidProvider
}

protocol ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool
    func send(content: String) -> AnyPublisher<Void, Error>
    func send(content: String) async throws
}

struct EmailReceiptProvider: ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool {
        method == .email
    }
    
    func send(content: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Task {
                do {
                    // *오류가 발생할 수 있는 비동기 동작이라고 가정
                    try await print("==이메일 영수증 전송==\n\(content)")
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func send(content: String) async throws {
        print("이메일 영수증 전송: \(content)")
    }
}

struct SMSReceiptProvider: ReceiptProvider {
    func canSend(_ method: ReceiptProvideMethod) -> Bool {
        method == .sms
    }
    
    func send(content: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Task {
                do {
                    // *오류가 발생할 수 있는 비동기 동작이라고 가정
                    try await print("==문자 영수증 전송==\n\(content)")
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func send(content: String) async throws {
        print("==문자 영수증 전송==\n\(content)")
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
    
    func sendReceipt() -> AnyPublisher<Void, Error> {
        guard let provider: ReceiptProvider = providers.first(where: { $0.canSend(method) })
        else {
            return Fail(error: ReceiptProviderError.noValidProvider).eraseToAnyPublisher()
        }
        
        return provider
            .send(content: receiptContent)
    }
    
    func sendReceipt() async throws {
        guard let provider: ReceiptProvider = providers.first(where: { $0.canSend(method) })
        else {
            throw ReceiptProviderError.noValidProvider
        }
        
        try await provider
            .send(content: receiptContent)
    }
}
