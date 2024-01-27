//
//  DataError.swift
//  ParcelInvoiceMaker
//
//  Created by ChangMin on 1/24/24.
//

import Foundation

enum DataError: Error {
    case invalideData
}

extension DataError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalideData:
            return "유효하지 않은 데이터입니다."
        }
    }
}
