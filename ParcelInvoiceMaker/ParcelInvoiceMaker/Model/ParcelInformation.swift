//
//  ParcelInformation.swift
//  ParcelInvoiceMaker
//
//  Created by 박상욱 on 1/23/24.
//

import Foundation


struct ParcelInformation {
    private(set) var address: Address
    private(set) var deliveryCost: Cost
    private(set) var discountStrategy: DiscountStrategy
    private(set) var receiptStrategy: ReceiptDipatchStrategy
    
    private(set) var receiverInfomation: ReceiverInformation
    
    var discountedCost: Cost {
        discountStrategy.applyDiscount(deliveryCost: deliveryCost)
    }

    init(address: String,
         receiverName: String,
         receiverMobile: String,
         deliveryCost: Int,
         discountType: String,
         receiptType: String) throws {
        
        self.address = try Address(address)
        self.deliveryCost = Cost(deliveryCost)
        self.discountStrategy = DiscountStrategyFactory.createStrategy(type: discountType)
        self.receiptStrategy = try ReceiptStrategyFactory.createStrategy(type: receiptType)
        
        let name = try PersonName(receiverName)
        let mobile = try PhoneNumber(receiverMobile)
        self.receiverInfomation = ReceiverInformation(
            name: name,
            mobile: mobile
        )
    }
}
