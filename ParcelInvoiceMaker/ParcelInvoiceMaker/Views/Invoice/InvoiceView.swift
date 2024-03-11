//
//  ParcelInvoiceMaker - InvoiceView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class InvoiceView: UIView {
  private let parcelInformation: ParcelInformation
  
  init(parcelInformation: ParcelInformation) {
    self.parcelInformation = parcelInformation
    super.init(frame: .zero)
    backgroundColor = .systemBrown
    layoutView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layoutView() {
    let nameLabel: UILabel = .init(
      text: "이름 : \(parcelInformation.receiver.name)",
      color: .black,
      font: .preferredFont(forTextStyle: .largeTitle)
    )
    
    let mobileLabel: UILabel = .init(
      text: "전화 : \(parcelInformation.receiver.mobile)",
      color: .black,
      font: .preferredFont(forTextStyle: .largeTitle)
    )
    
    let addressLabel: UILabel = .init(
      text: "주소 : \(parcelInformation.receiver.address)",
      color: .black,
      font: .preferredFont(forTextStyle: .largeTitle)
    )
    
    let costLabel: UILabel = .init(
      text: "요금 : \(parcelInformation.deliveryCost.getDiscountedCost())",
      color: .black,
      font: .preferredFont(forTextStyle: .largeTitle)
    )
    
    let mainStackView: UIStackView = .init(
      arrangedSubviews: [nameLabel, mobileLabel, addressLabel, costLabel],
      spacing: 16,
      axis: .vertical
    )
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(mainStackView)
    
    let stampImageView: UIImageView = .init(image: UIImage(named: "stamp"))
    stampImageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stampImageView)
    
    let safeArea: UILayoutGuide = safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      mainStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -22),
      mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
      mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32),
      stampImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.2),
      stampImageView.widthAnchor.constraint(equalTo: stampImageView.heightAnchor),
      stampImageView.centerXAnchor.constraint(equalTo: mainStackView.trailingAnchor),
      stampImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -30)
    ])
  }
  
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else {
      return
    }
    
    let (dx, dy) = (bounds.width * 0.08, bounds.height * 0.15)
    
    context.move(to: CGPoint(x: dx, y: dy))
    context.addRect(bounds.insetBy(dx: dx, dy:dy))
    context.setLineWidth(5)
    context.setStrokeColor(UIColor.red.cgColor)
    context.drawPath(using: .stroke)
  }
}
