//
//  ParcelInvoiceMaker - ParcelOrderViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Combine

class ParcelOrderViewController: UIViewController {
    private let parcelProcessor: ParcelOrderProcessor
    private var cancellables: Set<AnyCancellable>
    
    init(parcelProcessor: ParcelOrderProcessor) {
        self.parcelProcessor = parcelProcessor
        self.cancellables = .init()
        
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
    func parcelOrderMadeCombine(_ parcelInformation: ParcelInformation, receiptInfo: ReceiptProvideInfo) {
        parcelProcessor
            .process(parcelInformation: parcelInformation, receiptInfo: receiptInfo)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .finished:
                    pushInvoiceViewController(parcelInformation: parcelInformation)
                case .failure(let error):
                    // handle error
                    print(error)
                }
            } receiveValue: { _ in
                // do nothing
            }.store(in: &cancellables)
    }
    
    func parcelOrderMadeAsyncAwait(_ parcelInformation: ParcelInformation, receiptInfo: ReceiptProvideInfo) {
        Task {
            do {
                let parcelInformation: ParcelInformation = try await parcelProcessor.process(parcelInformation: parcelInformation, receiptInfo: receiptInfo)
                
                DispatchQueue.main.async { [weak self] in
                    self?.pushInvoiceViewController(parcelInformation: parcelInformation)
                }
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    private func pushInvoiceViewController(parcelInformation: ParcelInformation) {
        let invoiceViewController: InvoiceViewController = .init(parcelInformation: parcelInformation)
        navigationController?.pushViewController(invoiceViewController, animated: true)
    }
}
