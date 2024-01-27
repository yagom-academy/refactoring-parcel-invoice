//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ParcelOrderViewController: UIViewController {
    
    private let parcelProcessor: ParcelOrderProcessorPersistence
    
    init(parcelProcessor: ParcelOrderProcessorPersistence) {
        self.parcelProcessor = parcelProcessor
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "택배보내기"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func pushInvoiceViewController(parcelInformation: ParcelInformation) {
        let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
        navigationController?.pushViewController(invoiceViewController, animated: true)
    }
    
    override func loadView() {
        view = ParcelOrderView(delegate: self)
    }

}

// MARK: - ParcelOrderViewDelegate
extension ParcelOrderViewController: ParcelOrderViewDelegate {
    func parcelOrderMade(_ parcelInformation: ParcelInformation) {
        parcelProcessor.process(parcelInformation: parcelInformation, onComplete: pushInvoiceViewController)
    }
}
