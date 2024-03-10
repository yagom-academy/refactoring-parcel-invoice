//
//  ParcelInvoiceMaker - ParcelOrderView.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

protocol ParcelOrderViewDelegate: AnyObject {
  func parcelOrderMade(_ parcelInformation: ParcelInformation)
}

final class ParcelOrderView: UIView {
  
  private weak var delegate: ParcelOrderViewDelegate?
  
  private let receiverNameField: UITextField = {
    let field: UITextField = .init()
    field.borderStyle = .roundedRect
    return field
  }()
  
  private let receiverMobileField: UITextField = {
    let field: UITextField = .init()
    field.borderStyle = .roundedRect
    field.keyboardType = .phonePad
    return field
  }()
  
  private let addressField: UITextField = {
    let field: UITextField = .init()
    field.borderStyle = .roundedRect
    return field
  }()
  
  private let costField: UITextField = {
    let field: UITextField = .init()
    field.borderStyle = .roundedRect
    field.keyboardType = .decimalPad
    return field
  }()
  
  private let discountSegmented: UISegmentedControl = {
    let control: UISegmentedControl = .init()
    for discount in Discount.allCases {
      control.insertSegment(withTitle: discount.title, at: discount.rawValue, animated: false)
    }
    control.selectedSegmentIndex = 0
    return control
  }()
  
  init(delegate: ParcelOrderViewDelegate) {
    self.delegate = delegate
    super.init(frame: .zero)
    
    backgroundColor = .systemBrown
    layoutView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func touchUpOrderButton(_ sender: UIButton) {
    guard let name: String = receiverNameField.text,
          let mobile: String = receiverMobileField.text,
          let address: String = addressField.text,
          let costString: String = costField.text,
          name.isEmpty == false,
          mobile.isEmpty == false,
          address.isEmpty == false,
          costString.isEmpty == false,
          let cost: Int = .init(costString),
          let discount: Discount = .init(rawValue: discountSegmented.selectedSegmentIndex)
    else {
      return
    }
    
    let receiver: ReceiverInformation = .init(address: address, name: name, mobile: mobile)
    let deliveryCost: DeliveryCost = .init(cost: cost, discount: discount)
    let parcelInformation: ParcelInformation = .init(
        receiver: receiver,
        deliveryCost: deliveryCost
    )
    
    delegate?.parcelOrderMade(parcelInformation)
  }
  
  private func layoutView() {
    
    let logoImageView: UIImageView = .init(image: .init(named: "post_office_logo"))
    logoImageView.contentMode = .scaleAspectFit
    
    let nameLabel: UILabel = .init(
      text: "이름",
      color: .black,
      huggingPriority: .defaultHigh,
      for: .horizontal
    )
    
    let mobileLabel: UILabel = .init(
      text: "전화",
      color: .black,
      huggingPriority: .defaultHigh,
      for: .horizontal
    )
    
    let addressLabel: UILabel = .init(
      text: "주소",
      color: .black,
      huggingPriority: .defaultHigh,
      for: .horizontal
    )
    
    let costLabel: UILabel = .init(
      text: "요금",
      color: .black,
      huggingPriority: .defaultHigh,
      for: .horizontal
    )
    
    let discountLabel: UILabel = .init(
      text: "할인",
      color: .black,
      huggingPriority: .defaultHigh,
      for: .horizontal
    )    
    
    let nameStackView: UIStackView = .init(arrangedSubviews: [nameLabel, receiverNameField])
    nameStackView.distribution = .fill
    nameStackView.spacing = 8
    nameStackView.axis = .horizontal
    
    let mobileStackView: UIStackView = .init(arrangedSubviews: [mobileLabel, receiverMobileField])
    mobileStackView.spacing = 8
    mobileStackView.axis = .horizontal
    
    let addressStackView: UIStackView = .init(arrangedSubviews: [addressLabel, addressField])
    addressStackView.spacing = 8
    addressStackView.axis = .horizontal
    
    let costStackView: UIStackView = .init(arrangedSubviews: [costLabel, costField])
    costStackView.spacing = 8
    costStackView.axis = .horizontal
    
    let discountStackView: UIStackView = .init(arrangedSubviews: [discountLabel, discountSegmented])
    discountStackView.spacing = 8
    discountStackView.axis = .horizontal
    
    let makeOrderButton: UIButton = .init(type: .system)
    makeOrderButton.backgroundColor = .white
    makeOrderButton.setTitle("택배 보내기", for: .normal)
    makeOrderButton.addTarget(self, action: #selector(touchUpOrderButton), for: .touchUpInside)
    
    let mainStackView: UIStackView = .init(
      arrangedSubviews: [
        logoImageView, 
        nameStackView,
        mobileStackView,
        addressStackView,
        costStackView, 
        discountStackView,
        makeOrderButton
      ]
    )
    mainStackView.axis = .vertical
    mainStackView.distribution = .fillEqually
    mainStackView.spacing = 8
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(mainStackView)
    
    let safeArea: UILayoutGuide = safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      logoImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1),
      mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
      mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
      mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeArea.bottomAnchor, constant: -16)
    ])
  }
}
