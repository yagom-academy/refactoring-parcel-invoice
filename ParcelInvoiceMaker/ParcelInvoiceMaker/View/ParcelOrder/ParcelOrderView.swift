//
//  ParcelInvoiceMaker - ParcelOrderView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

protocol ParcelOrderViewDelegate {
    func parcelOrderMade(_ parcelInformation: ParcelInformation)
}

class ParcelOrderView: UIView {
    private enum ResourceText {
        static let none = "없음"
        static let vip = "VIP"
        static let coupon = "쿠폰"
        static let name = "이름"
        static let mobile = "전화"
        static let address = "주소"
        static let cost = "요금"
        static let discount = "할인"
        static let sendParcel = "택배 보내기"
    }
    
    private var delegate: ParcelOrderViewDelegate!
    
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
        control.insertSegment(withTitle: ResourceText.none, at: 0, animated: false)
        control.insertSegment(withTitle: ResourceText.vip, at: 1, animated: false)
        control.insertSegment(withTitle: ResourceText.coupon, at: 2, animated: false)
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
              let cost: Int = Int(costString),
              let discount: Discount = Discount(rawValue: discountSegmented.selectedSegmentIndex),
              ParcelOrderValidator.validate(address: address),
              ParcelOrderValidator.validate(name: name),
              ParcelOrderValidator.validate(mobile: mobile),
              ParcelOrderValidator.validate(cost: cost)
        else {
            return
        }
        
        let receiver: Receiver = Receiver(address: address, name: name, mobile: mobile)
        let deliveryCost: Cost = cost
        
        let parcelInformation: ParcelInformation = .init(receiver: receiver,
                                                         deliveryCost: deliveryCost,
                                                         discount: discount)
        delegate.parcelOrderMade(parcelInformation)
    }
    
    private func layoutView() {
        
        let logoImageView: UIImageView = UIImageView(image: UIImage(named: AssetName.postOfficeLogo))
        logoImageView.contentMode = .scaleAspectFit
        
        let nameLabel: UILabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = ResourceText.name
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let mobileLabel: UILabel = UILabel()
        mobileLabel.textColor = .black
        mobileLabel.text = ResourceText.mobile
        mobileLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let addressLabel: UILabel = UILabel()
        addressLabel.textColor = .black
        addressLabel.text = ResourceText.address
        addressLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let costLabel: UILabel = UILabel()
        costLabel.textColor = .black
        costLabel.text = ResourceText.cost
        costLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let discountLabel: UILabel = UILabel()
        discountLabel.textColor = .black
        discountLabel.text = ResourceText.discount
        discountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
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
        
        let makeOrderButton: UIButton = UIButton(type: .system)
        makeOrderButton.backgroundColor = .white
        makeOrderButton.setTitle(ResourceText.sendParcel, for: .normal)
        makeOrderButton.addTarget(self, action: #selector(touchUpOrderButton), for: .touchUpInside)
        
        let mainStackView: UIStackView = .init(arrangedSubviews: [logoImageView, nameStackView, mobileStackView, addressStackView, costStackView, discountStackView, makeOrderButton])
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
