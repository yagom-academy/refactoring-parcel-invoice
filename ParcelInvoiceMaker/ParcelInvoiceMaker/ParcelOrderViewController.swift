//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class ParcelOrderViewController: UIViewController, ParcelOrderViewDelegate {
    
    private let parcelProcessor: ParcelOrderProcessor
        
    init(parcelProcessor: ParcelOrderProcessor) {
        self.parcelProcessor = parcelProcessor
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = setNaviTitle.parcelSend
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func parcelOrderMade(_ parcelInformation: ParcelInformation) {
        self.parcelProcessor.process(parcelInformation: parcelInformation) { (parcelInformation) in
            let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
            navigationController?.pushViewController(invoiceViewController, animated: true)
        }
    }
    
    override func loadView() {
        view = ParcelOrderView(delegate: self)
    }

}

