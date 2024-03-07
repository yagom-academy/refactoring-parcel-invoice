//
//  ParcelOrderProcessor.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

final class ParcelOrderProcessor: ParcelOrderProcessable {
  private let persistence: ParcelInformationPersistence
  
  init(persistence: ParcelInformationPersistence) {
    self.persistence = persistence
  }
  
  func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
    persistence.save(parcelInformation: parcelInformation)
    
    onComplete(parcelInformation)
  }
}
