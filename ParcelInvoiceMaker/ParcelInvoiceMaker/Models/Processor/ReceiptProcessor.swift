//
//  ReceiptProcessor.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/25/24.
//

import Foundation

class ReceiptProcessor: ReceiptManageable {
    func send(parcelInformation: ParcelInformationProvider) {
        //영수증 발송
        print("주문 영수증이 \(parcelInformation.getReceiptSendMethod())로 전송되었습니다.")
    }
}

protocol ReceiptManageable {
    func send(parcelInformation: ParcelInformationProvider)
}
