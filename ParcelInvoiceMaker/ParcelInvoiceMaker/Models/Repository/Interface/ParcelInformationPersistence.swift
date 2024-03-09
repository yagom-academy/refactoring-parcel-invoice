//
//  ParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

protocol ParcelInformationPersistence {
  func save(parcelInformation: ParcelInformation)
}
