//
//  ParcelInvoiceMaker - InvoiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class InvoiceViewController: UIViewController {

    private let parcelInformation: ParcelInformation
    
    init(parcelInformation: ParcelInformation) {
        self.parcelInformation = parcelInformation
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = setNaviTitle.labelInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = InvoiceView(parcelInformation: parcelInformation)
    }
    
}
