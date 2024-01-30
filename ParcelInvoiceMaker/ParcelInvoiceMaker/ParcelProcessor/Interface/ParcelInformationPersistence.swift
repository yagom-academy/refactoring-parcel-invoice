//
//  ParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}
