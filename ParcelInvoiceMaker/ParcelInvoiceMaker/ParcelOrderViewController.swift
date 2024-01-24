//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ParcelOrderViewController: UIViewController, ParcelOrderViewDelegate {
    // Protocol 타입으로 바꿔주면서 결합을 좀 더 느슨하게 만들 수 있지않을까 싶어서 분리함.
    //private let parcelProcessor: ParcelOrderProcessor
    private let parcelProcessor: ParcelOrderProcessorPersistence
    
    init() {
        // 인스턴스를 여기서는 생성했지만, 주입받을 수도 있도록 변경
        self.parcelProcessor = ParcelOrderProcessor()
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "택배보내기"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 택배 주문을 만드는 곳인데 1)프로세스를 진행하고나서 2) 송장번호 확인하는 페이지까지 이동시키네 -> 분리해보자
    func parcelOrderMade(_ parcelInformation: ParcelInformation) {
        parcelProcessor.process(parcelInformation: parcelInformation) { (parcelInformation) in
            /** 분리하자
            let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
            navigationController?.pushViewController(invoiceViewController, animated: true)
            */
            self.pushInvoiceViewController(parcelInformation: parcelInformation)
        }
    }
    
    private func pushInvoiceViewController(parcelInformation: ParcelInformation) {
        let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
        navigationController?.pushViewController(invoiceViewController, animated: true)
    }
    
    override func loadView() {
        view = ParcelOrderView(delegate: self)
    }

}

