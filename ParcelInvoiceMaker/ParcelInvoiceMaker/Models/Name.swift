//
//  Name.swift
//  ParcelInvoiceMaker
//
//  Created by JunHeeJo on 1/26/24.
//

import Foundation

struct Name {
    let value: String
    
    init(_ value: String) throws {
        let koreanNameRegex: String = "^[\(KoreanNameRules.firstKoreanUnicode)-\(KoreanNameRules.lastKoreanUnicode)]{\(KoreanNameRules.minNameCount),\(KoreanNameRules.maxNameCount)}$"
        guard  value.range(of: koreanNameRegex, options: .regularExpression) != nil else { throw NSError() }
        self.value = value
    }
}

enum KoreanNameRules {
    static let firstKoreanUnicode: String = "가"
    static let lastKoreanUnicode: String = "힣"
    static let minNameCount: Int = 2
    static let maxNameCount: Int = 8
}
