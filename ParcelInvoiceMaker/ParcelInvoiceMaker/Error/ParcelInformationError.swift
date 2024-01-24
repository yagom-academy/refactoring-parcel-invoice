//
//  ParcelInformationError.swift
//  ParcelInvoiceMaker
//
//  Created by MIN SEONG KIM on 2024/01/25.
//

import Foundation

// 택배정보 입력 에러
enum ParcelInformationError: Int, Error {
    case addressError = 0,
         nameError,
         mobileError,
         deliveryCostError
}
