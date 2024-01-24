//
//  ReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// 보내는사람 정보
struct ReceiverInfo {
    private let receiverName: Name
    private let receiverMobile: Mobile
    
    init(receiverName: Name, receiverMobile: Mobile) {
        self.receiverName = receiverName
        self.receiverMobile = receiverMobile
    }
    
    func getReceiverName() -> String {
        return receiverName.getValue()
    }
    
    func getReceiverMobile() -> String {
        return receiverMobile.getValue()
    }
}

