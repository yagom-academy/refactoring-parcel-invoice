//
//  ParcelInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/22/24.
//

import Foundation

protocol ParcelInformationProvider {
    func getAddress() -> String
    func getReceiverName() -> String
    func getReceiverMobile() -> String
    func getDiscountedCost() -> Int
}

struct ParcelInformation: ParcelInformationProvider {
    private let parcelInfo: ParcelInfo

    init(parcelInfo: ParcelInfo) {
        self.parcelInfo = parcelInfo
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 주소를 반환합니다.
    func getAddress() -> String {
        return parcelInfo.address
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 이름을 반환합니다.
    func getReceiverName() -> String {
        return parcelInfo.getReceiverName()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 받는사람 휴대폰번호를 반환합니다.
    func getReceiverMobile() -> String {
        return parcelInfo.getReceiverMobile()
    }
    
    // 객체 미용 체조, 4원칙 한 줄에 한 점만 사용
    // 할인비용을 반환합니다.
    func getDiscountedCost() -> Int {
        return parcelInfo.getDiscountedCost()
    }
}

