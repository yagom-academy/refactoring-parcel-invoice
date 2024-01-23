//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ParcelOrderViewController: UIViewController {
  
  struct Dependency {
    let invoiceViewControllerFactory: (ParcelInformation) -> InvoiceViewController
    let parcelOrderService: ParcelOrderService
  }
  
  private let dependency: Dependency
  
  init(
    dependency: Dependency
  ) {
    self.dependency = dependency
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

extension ParcelOrderViewController: ParcelOrderViewDelegate {
  func parcelOrderMade(_ parcelInformation: ParcelInformation) {
    dependency.parcelOrderService.process(parcelInformation: parcelInformation) { (parcelInformation) in
      let invoiceViewController = dependency.invoiceViewControllerFactory(parcelInformation)
      navigationController?.pushViewController(invoiceViewController, animated: true)
    }
  }
}
