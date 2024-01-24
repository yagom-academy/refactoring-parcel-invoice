//
//  ReceiverInfo.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/23/24.
//

import Foundation

// 보내는사람 정보
struct ReceiverInfo {
    let receiverName: String
    let receiverMobile: String
    
    func getReceiverName() -> String {
        return receiverName
    }
    
    func getReceiverMobile() -> String {
        return receiverMobile
    }
}

