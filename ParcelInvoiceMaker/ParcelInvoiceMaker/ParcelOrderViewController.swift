//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ParcelOrderViewController: UIViewController {
    private let parcelProcessor: OrderProcessable
    
    init(processor: OrderProcessable) {
        self.parcelProcessor = processor
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = ParcelOrderMessage.title
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
        parcelProcessor.process(parcelInformation: parcelInformation) { (parcelInformation) in
            parcelProcessor.sendRecipt(parcelInformation: parcelInformation)
            let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
            navigationController?.pushViewController(invoiceViewController, animated: true)
        }
    }
}

struct ParcelOrderMessage: Titleable {
    static let title: String = "택배보내기"
    static let sendParcel: String = "택배 보내기"
}
