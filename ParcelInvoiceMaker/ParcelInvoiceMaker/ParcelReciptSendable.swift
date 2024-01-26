//
//  ParcelReciptSendable.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/26.
//

import Foundation

protocol ParcelReciptSendable {
    func send(costInformation: CostInformation)
}

class ReciptReciptSender: ParcelReciptSendable {
    
    private var strategy: SendStrategy?
    
    init(method: SendMethod) {
        let strategies: [SendStrategy] = [NoSend(), EmailSend(), SmsSend()]
        strategy = strategies.first { $0.canUseMethod(method) }
    }
    
    func send(costInformation: CostInformation) {
        guard let discountedCost = costInformation.discountedCost() else { return }
        self.strategy?.send(deliveryCost: costInformation.deliveryCost, discountedCost: discountedCost)
    }
}
