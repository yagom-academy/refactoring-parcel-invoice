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
    
    let appDependency = AppDependency.resolve(scene)
    self.window = appDependency.window
  }
}
