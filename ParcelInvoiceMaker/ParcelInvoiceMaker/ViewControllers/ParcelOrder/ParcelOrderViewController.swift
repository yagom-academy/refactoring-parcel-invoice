//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ParcelOrderViewController: UIViewController {
  private let processor: ParcelOrderProcessable
  
  init(processor: ParcelOrderProcessable) {
    self.processor = processor
    super.init(nibName: nil, bundle: nil)
    navigationItem.title = "택배보내기"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = ParcelOrderView(delegate: self)
  }
}

extension ParcelOrderViewController :ParcelOrderViewDelegate {
  func parcelOrderMade(_ parcelInformation: ParcelInformation) {
    processor.process(parcelInformation: parcelInformation) { (parcelInformation) in
      let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
      navigationController?.pushViewController(invoiceViewController, animated: true)
    }
  }
}
