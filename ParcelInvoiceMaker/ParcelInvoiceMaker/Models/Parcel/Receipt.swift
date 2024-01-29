//
//  Receipt.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/25/24.
//

import Foundation

enum Receipt: Int {
    case email = 0, message
    var method: String {
        switch self {
        case .email:
            return "이메일"
        case .message:
            return "문자"
        }
    }
}
