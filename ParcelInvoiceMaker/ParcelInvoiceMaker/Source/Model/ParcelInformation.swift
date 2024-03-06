//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 홍승완 on 2024/03/04.
//

import Foundation

struct ParcelInformation {
    private let receiverInformation: ReceiverInformation
    private let costInformation: CostInformation
    
    init(receiverInformation: ReceiverInformation,
         costInformation: CostInformation) {
        self.receiverInformation = receiverInformation
        self.costInformation = costInformation
    }
    
    func getReceiverName() -> String {
        return receiverInformation.getReceiverName()
    }
    
    func getReceiverAddress() -> String {
        return receiverInformation.getAddress()
    }
    
    func getReceiverMobile() -> String {
        return receiverInformation.getReceiverMobile()
    }
    
    func getDiscountedCost() -> Int {
        return costInformation.getDiscountedCost()
    }
}
