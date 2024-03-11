//
//  ParcelProcessor.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

protocol ParcelProcessor {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}
