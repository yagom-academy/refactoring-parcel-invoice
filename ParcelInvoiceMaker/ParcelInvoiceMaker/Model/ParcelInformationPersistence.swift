//
//  ParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

protocol ParcelInformationPersistence {
    func save(parcelInformation: ParcelInformation)
}
