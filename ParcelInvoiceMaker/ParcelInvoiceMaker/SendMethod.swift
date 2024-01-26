//
//  SendMethod.swift
//  ParcelInvoiceMaker
//
//  Created by Daegeon Choi on 2024/01/26.
//

import Foundation

protocol SendStrategy {
    func send(deliveryCost: Int, discountedCost: Int)
    func canUseMethod(_ method: SendMethod) -> Bool
}

extension SendStrategy {
    func recipt(_ deliveryCost: Int, _ discountedCost: Int) -> String {
        return "배송비 \(deliveryCost), 할인가 \(discountedCost)"
    }
}

struct NoSend: SendStrategy {
    func send(deliveryCost: Int, discountedCost: Int) {
        print("전송 안함")
    }
    
    func canUseMethod(_ method: SendMethod) -> Bool {
        return method == .none
    }
}

struct EmailSend: SendStrategy {
    func send(deliveryCost: Int, discountedCost: Int) {
        let recipt: String = recipt(deliveryCost, discountedCost)
        print("[이메일] \(recipt)")
    }
    
    func canUseMethod(_ method: SendMethod) -> Bool {
        return method == .email
    }
}

struct SmsSend: SendStrategy {
    func send(deliveryCost: Int, discountedCost: Int) {
        let recipt: String = recipt(deliveryCost, discountedCost)
        print("[문자] \(recipt)")
    }
    
    func canUseMethod(_ method: SendMethod) -> Bool {
        return method == .sms
    }
}

enum SendMethod: Int {
    case none = 0, email, sms
}
