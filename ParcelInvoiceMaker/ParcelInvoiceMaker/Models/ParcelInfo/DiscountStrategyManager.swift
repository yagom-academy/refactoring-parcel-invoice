//
//  DiscountStrategyManager.swift
//  ParcelInvoiceMaker
//
//  Created by 김창규 on 1/25/24.
//

import Foundation

// 객체 미용 체조, 8원칙 일급 콜렉션 사용
class DiscountStrategyManager {
    private var items: [DiscountStrategy]
    
    init(items: [DiscountStrategy]) {
        self.items = items
    }
    
    // 할인 정책들을 반환합니다.
    func getStrategies() -> [DiscountStrategy] {
        return items
    }
    
    // 특정 할인 정책이 아이템에 존재하는지 확인합니다.
    func isContainsStrategy<T: DiscountStrategy>(_ strategyType: T.Type) -> Bool {
        return items.contains { $0 is T }
    }
    
    // 할인 정책을 삭제합니다.
    func removeStrategy<T: DiscountStrategy>(_ strategyType: T.Type) {
        guard let index = items.firstIndex(where: {
            $0 is T }) else {
            return
        }
        
        items.remove(at: index)
    }
    
    // 할인 정책을 추가합니다.
    func addStrategy(_ strategy: DiscountStrategy) {
        guard (items.contains {type(of: $0) == type(of: strategy)}) else { return }
        
        items.append(strategy)
    }
    
    // 할인 정책에 대한 요구사항에 따라...
}
