//
//  ParcelInvoiceMaker - ParcelProcessor.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

final class ParcelOrderProcessor {
  private let databaseParcelInformationPersistence: DatabaseParcelInformationPersistence
  
  init(databaseParcelInformationPersistence: DatabaseParcelInformationPersistence) {
    self.databaseParcelInformationPersistence = databaseParcelInformationPersistence
  }
}
 
extension ParcelOrderProcessor: ParcelOrderService {
  // 택배 주문 처리 로직
  func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
    
    // 데이터베이스에 주문 저장
    databaseParcelInformationPersistence.save(parcelInformation: parcelInformation)
    
    onComplete(parcelInformation)
  }
}
