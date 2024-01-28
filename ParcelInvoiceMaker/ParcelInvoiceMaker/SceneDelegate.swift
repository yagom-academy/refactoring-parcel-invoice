//
//  ParcelInvoiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene: UIWindowScene = (scene as? UIWindowScene) else { return }
        
        let factory = ConcreteParcelFactory()
        
        let databaseParcelInformationPersistence: ParcelInformationPersistence = factory.createParcelInformationPersistence()
        let parcelProcessor: ParcelOrderProcessor = factory.createParcelOrderProcessor(parcelInformationPersistence: databaseParcelInformationPersistence)
        let viewController: ParcelOrderViewController = factory.createParcelOrderViewController(processor: parcelProcessor)
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .black
        
        let window: UIWindow = UIWindow(windowScene: scene)
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

