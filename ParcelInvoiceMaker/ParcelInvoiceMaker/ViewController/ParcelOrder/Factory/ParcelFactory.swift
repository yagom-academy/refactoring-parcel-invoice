//
//  ParcelFactory.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/28.
//

import Foundation

protocol ParcelFactory {
    func createParcelInformationPersistence() -> ParcelInformationPersistence
    func createParcelOrderProcessor(parcelInformationPersistence: ParcelInformationPersistence) -> ParcelOrderProcessor
    func createParcelOrderViewController(processor: ParcelOrderProcessorProtocol) -> ParcelOrderViewController
}

class ConcreteParcelFactory: ParcelFactory {
    func createParcelInformationPersistence() -> ParcelInformationPersistence {
        return DatabaseParcelInformationPersistence()
    }
    
    func createParcelOrderProcessor(parcelInformationPersistence: ParcelInformationPersistence) -> ParcelOrderProcessor {
        return ParcelOrderProcessor(databaseParcelInformationPersistence: parcelInformationPersistence)
    }
    
    func createParcelOrderViewController(processor: ParcelOrderProcessorProtocol) -> ParcelOrderViewController {
        return ParcelOrderViewController(parcelProcessor: processor)
    }
}

class Client {
    
}
