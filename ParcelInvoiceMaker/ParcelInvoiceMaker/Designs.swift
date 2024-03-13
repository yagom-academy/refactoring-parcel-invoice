//
//  Designs.swift
//  ParcelInvoiceMaker
//
//  Created by qussk on 3/13/24.
//

import UIKit


class RoundedTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        self.borderStyle = .roundedRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

