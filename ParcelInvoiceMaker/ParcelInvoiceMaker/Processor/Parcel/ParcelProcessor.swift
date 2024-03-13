//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import Foundation
import Combine

protocol ParcelOrderProcessor {
    
    func process(
        parcelInformation: ParcelInformation,
        receiptInfo: ReceiptProvideInfo
    ) -> AnyPublisher<ParcelInformation, Error>
    
    func process(
        parcelInformation: ParcelInformation,
        receiptInfo: ReceiptProvideInfo
    ) async throws -> ParcelInformation
}

final class ParcelOrderProcessorImpl: ParcelOrderProcessor {
    
    private let databaseParcelInformationPersistence: ParcelInformationPersistence
    
    init(databaseParcelInformationPersistence: ParcelInformationPersistence) {
        self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
    }
}

extension ParcelOrderProcessorImpl {
    
    // 택배 주문 처리 로직
    func process(
        parcelInformation: ParcelInformation,
        receiptInfo: ReceiptProvideInfo
    ) -> AnyPublisher<ParcelInformation, Error> {
        
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 전송
        return receiptInfo.sendReceipt()
            .flatMap { _ in
                Just(parcelInformation)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func process(parcelInformation: ParcelInformation, receiptInfo: ReceiptProvideInfo) async throws -> ParcelInformation {
        // 데이터베이스에 주문 저장
        databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
        
        // 영수증 전송
        try await receiptInfo.sendReceipt()
        
        return parcelInformation
    }
}
