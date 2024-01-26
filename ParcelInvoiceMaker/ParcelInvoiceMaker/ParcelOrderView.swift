//
//  ParcelInvoiceMaker - ParcelOrderView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

protocol ParcelOrderViewDelegate {
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
        control.insertSegment(withTitle: UI.none, at: 0, animated: false)
        control.insertSegment(withTitle: UI.vip, at: 1, animated: false)
        control.insertSegment(withTitle: UI.coupon, at: 2, animated: false)
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
        if let parcelInformation = makeParcelInformation() {
            delegate.parcelOrderMade(parcelInformation)
        }
    }
    
    private func makeParcelInformation() -> ParcelInformation? {
        if let parcelInputData = validateInformation() {
            let receiver = makeReceiver(name: parcelInputData.name,
                                        mobile: parcelInputData.mobile,
                                        address: parcelInputData.address)
            let charge = makeCharge(cost: parcelInputData.cost,
                                    discount: parcelInputData.discount)
            return ParcelInformation(receiver: receiver, charge: charge)
        }
        
        return nil
    }
    
    private func validateInformation() -> ParcelInputData? {
        guard let name: String = receiverNameField.text,
              let mobile: String = receiverMobileField.text,
              let address: String = addressField.text,
              let costString: String = costField.text,
              name.isEmpty == false,
              address.isEmpty == false,
              costString.isEmpty == false,
              let cost: Int = Int(costString),
              let discount: Discount = Discount(rawValue: discountSegmented.selectedSegmentIndex) else { return nil }
        
        return ParcelInputData(name: name,
                               mobile: mobile,
                               address: address,
                               cost: cost,
                               discount: discount)
    }
    
    private func makeReceiver(name: String, mobile: String, address: String) -> Receiver {
        return Receiver(address: address,
                        receiverName: name,
                        receiverMobile: mobile)
    }
    
    private func makeCharge(cost: Int, discount: Discount) -> Charge {
        return Charge(deliveryCost: cost,
                      discount: discount)
    }
}

extension ParcelOrderView {
    
    enum Layout {
        fileprivate static let stackViewSpacing: CGFloat = 8
        fileprivate static let stackViewConstraint: CGFloat = 16
    }
    
    private func layoutView() {
        
        let logoImageView: UIImageView = UIImageView(image: UIImage(named: "post_office_logo"))
        logoImageView.contentMode = .scaleAspectFit
        
        let nameLabel: UILabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = UI.name
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let mobileLabel: UILabel = UILabel()
        mobileLabel.textColor = .black
        mobileLabel.text = UI.mobile
        mobileLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let addressLabel: UILabel = UILabel()
        addressLabel.textColor = .black
        addressLabel.text = UI.address
        addressLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let costLabel: UILabel = UILabel()
        costLabel.textColor = .black
        costLabel.text = UI.cost
        costLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let discountLabel: UILabel = UILabel()
        discountLabel.textColor = .black
        discountLabel.text = UI.discount
        discountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let notificationLabel: UILabel = UILabel()
        notificationLabel.textColor = .black
        notificationLabel.text = UI.notification
        notificationLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let nameStackView: UIStackView = .init(arrangedSubviews: [nameLabel, receiverNameField])
        nameStackView.distribution = .fill
        nameStackView.spacing = Layout.stackViewSpacing
        nameStackView.axis = .horizontal
        
        let mobileStackView: UIStackView = .init(arrangedSubviews: [mobileLabel, receiverMobileField])
        mobileStackView.spacing = Layout.stackViewSpacing
        mobileStackView.axis = .horizontal
        
        let addressStackView: UIStackView = .init(arrangedSubviews: [addressLabel, addressField])
        addressStackView.spacing = Layout.stackViewSpacing
        addressStackView.axis = .horizontal
        
        let costStackView: UIStackView = .init(arrangedSubviews: [costLabel, costField])
        costStackView.spacing = Layout.stackViewSpacing
        costStackView.axis = .horizontal
        
        let discountStackView: UIStackView = .init(arrangedSubviews: [discountLabel, discountSegmented])
        discountStackView.spacing = Layout.stackViewSpacing
        discountStackView.axis = .horizontal
        
        let makeOrderButton: UIButton = UIButton(type: .system)
        makeOrderButton.backgroundColor = .white
        makeOrderButton.setTitle(UI.sendParcel, for: .normal)
        makeOrderButton.addTarget(self, action: #selector(touchUpOrderButton), for: .touchUpInside)
        
        let mainStackView: UIStackView = .init(arrangedSubviews: [logoImageView, nameStackView, mobileStackView, addressStackView, costStackView, discountStackView, makeOrderButton])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = Layout.stackViewSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        let safeArea: UILayoutGuide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1),
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Layout.stackViewConstraint),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Layout.stackViewConstraint),
            mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Layout.stackViewConstraint),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeArea.bottomAnchor, constant: -Layout.stackViewConstraint)
        ])
    }
}

