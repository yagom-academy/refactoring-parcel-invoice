//
//  Receipt.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/25/24.
//

import Foundation

enum Receipt: Int {
    case email = 0, message
    private var method: String {
        switch self {
        case .email:
            return "이메일"
        case .message:
            return "문자"
        }
    }

    // 영수증 발송 방식을 반환합니다.
    func getSendMethod() -> String {
        return method
    }
}
