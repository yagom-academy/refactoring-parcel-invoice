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
        control.insertSegment(withTitle: Discount.noneTitle, at: 0, animated: false)
        control.insertSegment(withTitle: Discount.vipTitle, at: 1, animated: false)
        control.insertSegment(withTitle: Discount.couponTitle, at: 2, animated: false)
        control.insertSegment(withTitle: Discount.subscribeTitle, at: 3, animated: false)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    private let receiptSegmented: UISegmentedControl = {
        let control: UISegmentedControl = .init()
        control.insertSegment(withTitle: Receipt.emailTitle, at: 0, animated: false)
        control.insertSegment(withTitle: Receipt.smsTitle, at: 1, animated: false)
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
    
    @objc private func touchUpOrderButton(_ sender: UIButton) throws {
        guard let name: String = receiverNameField.text,
              let mobile: String = receiverMobileField.text,
              let address: String = addressField.text,
              let costString: String = costField.text,
              name.isEmpty == false,
              mobile.isEmpty == false,
              MobileNumber.valid(with: mobile) == true,
              address.isEmpty == false,
              costString.isEmpty == false,
              let cost: Int = Int(costString),
              let discount: Discount = Discount(rawValue: discountSegmented.selectedSegmentIndex)
        else {
            return
        }
        
        let mobileNumber: MobileNumber = .init(value: mobile)
        let receiverInfo: ReceiverInfo = .init(address: address,
                                               name: name,
                                               mobile: mobileNumber)
        let parcelInformation: ParcelInformation = .init(receiverInfo: receiverInfo,
                                                         deliveryCost: cost,
                                                         discount: discount)
        delegate.parcelOrderMade(parcelInformation)
    }
    
    private func layoutView() {
        
        let logoImageView: UIImageView = UIImageView(image: UIImage(named: AssetName.postOfficeLogo))
        logoImageView.contentMode = .scaleAspectFit
        
        let nameLabel: UILabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = ParcelOrderInfo.name
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let mobileLabel: UILabel = UILabel()
        mobileLabel.textColor = .black
        mobileLabel.text = ParcelOrderInfo.mobile
        mobileLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let addressLabel: UILabel = UILabel()
        addressLabel.textColor = .black
        addressLabel.text = ParcelOrderInfo.address
        addressLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let costLabel: UILabel = UILabel()
        costLabel.textColor = .black
        costLabel.text = ParcelOrderInfo.cost
        costLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let discountLabel: UILabel = UILabel()
        discountLabel.textColor = .black
        discountLabel.text = ParcelOrderInfo.discount
        discountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let receiptLabel: UILabel = UILabel()
        receiptLabel.textColor = .black
        receiptLabel.text = ParcelOrderInfo.discount
        receiptLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let notificationLabel: UILabel = UILabel()
        notificationLabel.textColor = .black
        notificationLabel.text = ParcelOrderInfo.notification
        notificationLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
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
        
        let receiptStackView: UIStackView = .init(arrangedSubviews: [notificationLabel, receiptSegmented])
        receiptStackView.spacing = 8
        receiptStackView.axis = .horizontal
        
        let makeOrderButton: UIButton = UIButton(type: .system)
        makeOrderButton.backgroundColor = .white
        makeOrderButton.setTitle(ParcelOrderMessage.sendParcel, for: .normal)
        makeOrderButton.addTarget(self, action: #selector(touchUpOrderButton), for: .touchUpInside)
        
        let mainStackView: UIStackView = .init(arrangedSubviews: [logoImageView, nameStackView, mobileStackView, addressStackView, costStackView, discountStackView, receiptStackView, makeOrderButton])
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
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeArea.bottomAnchor, constant: -8)
        ])
    }
}

struct ParcelOrderInfo {
    static let name: String = "이름"
    static let mobile: String = "전화"
    static let address: String = "주소"
    static let cost: String = "요금"
    static let discount: String = "할인"
    static let notification: String = "알림"
}
