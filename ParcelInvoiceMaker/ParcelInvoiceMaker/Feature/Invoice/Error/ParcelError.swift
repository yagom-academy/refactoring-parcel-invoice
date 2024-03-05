//
//  ParcelError.swift
//  ParcelInvoiceMaker
//
//  Created by Choi Oliver on 3/4/24.
//

import Foundation

enum ParcelError: Error {
    case nameInvalid
    case phoneInvalid
    case addressInvalid
    case costInvalid
}
