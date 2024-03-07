//
//  ParcelOrderProcessable.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/7/24.
//

import Foundation

protocol ParcelOrderProcessable {
  func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void)
}
