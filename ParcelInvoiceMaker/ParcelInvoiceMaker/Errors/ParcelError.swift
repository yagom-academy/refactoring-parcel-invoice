//
//  ParcelError.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/24/24.
//

import Foundation

enum ParcelError: Error {
    case ReceiverName
    case mobileNumber
    case DeliveryCost
    case discountStrategy
}
