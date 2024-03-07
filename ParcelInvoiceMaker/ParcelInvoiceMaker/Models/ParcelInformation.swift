//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by Park Sungmin on 3/5/24.
//

import Foundation
struct ParcelInformation {
    let receiverInformation: ReceiverInformation
    let costInformation: CostInformation

    init(receiverInformation: ReceiverInformation, costInformation: CostInformation) {
        self.receiverInformation = receiverInformation
        self.costInformation = costInformation
    }
}
