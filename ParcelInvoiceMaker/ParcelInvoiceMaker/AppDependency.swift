//
//  AppDependency.swift
//  ParcelInvoiceMaker
//
//  Created by hyosung on 1/23/24.
//

import UIKit


struct AppDependency {
  let window: UIWindow
}

extension AppDependency {
  static func resolve(_ scene: UIWindowScene) -> AppDependency {
    let window: UIWindow = UIWindow(windowScene: scene)
    window.makeKeyAndVisible()
    
    let invoiceViewControllerFactory = { parcelInformation in
      InvoiceViewController(parcelInformation: parcelInformation)
    }
    
    let databaseParcelInformationPersistence = DatabaseParcelInformationPersistence()
    let parcelOrderProcess = ParcelOrderProcessor(databaseParcelInformationPersistence: databaseParcelInformationPersistence)
    
    let parcelOrderViewController = ParcelOrderViewController(
      dependency: .init(
        invoiceViewControllerFactory: invoiceViewControllerFactory,
        parcelOrderService: parcelOrderProcess
      )
    )
    
    let navigationController: UINavigationController = UINavigationController(rootViewController: parcelOrderViewController)
    navigationController.navigationBar.prefersLargeTitles = true
    navigationController.navigationBar.tintColor = .black
    
    window.rootViewController = navigationController
    
    return AppDependency(
      window: window
    )
  }
}
