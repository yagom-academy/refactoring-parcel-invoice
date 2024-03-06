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
    
    var receiverName: String {
        return receiverInformation.name
    }
    
    var receiverAddress: String {
        return receiverInformation.address
    }
    
    var receiverMobile: String {
        return receiverInformation.mobileNumber
    }
    
    func getDiscountedCost() -> Int {
        return costInformation.getDiscountedCost()
    }
}
