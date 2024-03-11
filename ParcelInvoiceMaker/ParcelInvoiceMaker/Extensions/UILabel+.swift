//
//  UILabel+.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import UIKit

extension UILabel {
  convenience init(text: String, color textColor: UIColor, font: UIFont) {
    self.init()
    self.text = text
    self.textColor = textColor
    self.font = font
  }
  
  convenience init(
    text: String, color
    textColor: UIColor, 
    huggingPriority priority: UILayoutPriority,
    for axis: NSLayoutConstraint.Axis
  ) {
    self.init()
    self.text = text
    self.textColor = textColor
    self.setContentHuggingPriority(priority, for: axis)
  }
}
