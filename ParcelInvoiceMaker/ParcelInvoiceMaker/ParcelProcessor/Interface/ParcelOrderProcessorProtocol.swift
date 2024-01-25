//
//  ParcelProcessorProtocol.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/26.
//

import Foundation

protocol ParcelOrderProcessorProtocol {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}
