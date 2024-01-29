//
//  ParcelInvoiceMaker - InvoiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class InvoiceViewController: UIViewController {

    private let parcelInformation: ParcelInformation
    
    init(parcelInformation: ParcelInformation) {
        self.parcelInformation = parcelInformation
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = InvoiceMessage.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = InvoiceView(parcelInformation: parcelInformation)
    }
    
}

protocol Titleable {
    static var title: String { get }
}

struct InvoiceMessage: Titleable {
    static let title: String = "송장정보"
}
