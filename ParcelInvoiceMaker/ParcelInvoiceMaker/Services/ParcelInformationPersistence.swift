//
//  ParcelInformationPersistence.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

protocol ParcelInformationPersistence: AnyObject {
  func save(parcelInformation: ParcelInformation)
}
