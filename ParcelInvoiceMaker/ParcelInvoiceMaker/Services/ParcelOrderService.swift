//
//  ParcelOrderService.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

protocol ParcelOrderService {
  func process(
    parcelInformation: ParcelInformation,
    onComplete: (ParcelInformation) -> Void
  )
}
