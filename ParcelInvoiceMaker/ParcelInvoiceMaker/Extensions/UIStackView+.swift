//
//  UIStackView+.swift
//  ParcelInvoiceMaker
//
//  Created by 홍은표 on 3/10/24.
//

import UIKit

extension UIStackView {
  convenience init(
    arrangedSubviews views: [UIView],
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat,
    axis: NSLayoutConstraint.Axis
  ) {
    self.init(arrangedSubviews: views)
    self.distribution = distribution
    self.spacing = spacing
    self.axis = axis
  }
}
