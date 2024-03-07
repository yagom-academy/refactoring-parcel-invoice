//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ParcelOrderViewController: UIViewController, ParcelOrderViewDelegate {
        
    private var parcelProcessor: ParcelProcessor = ParcelProcessor()
    
        
    init(parcelProcessor: ParcelProcessor) {
        super.init(nibName: nil, bundle: nil)
        self.parcelProcessor = parcelProcessor
        navigationItem.title = "택배보내기"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func parcelOrderMade(_ parcelInformation: ParcelInformation) {
        
        parcelProcessor.process(parcelInformation: parcelInformation) { (parcelInformation) in
            let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
            navigationController?.pushViewController(invoiceViewController, animated: true)
        }
        
    }
    

    override func loadView() {
        view = ParcelOrderView(delegate: self)
    }

}

class ParcelProcessor: ParcelInformationProcessProtocol & ParcelInformationPersistenceProtocol {
    func process(parcelInformation: ParcelInformation, onComplete: (ParcelInformation) -> Void) {
        // 데이터베이스에 주문 저장
        save(parcelInformation: parcelInformation)
        
        onComplete(parcelInformation)
    }
    
    func save(parcelInformation: ParcelInformation) {
        print("발송 정보를 데이터베이스에 저장했습니다.")
    }
}
