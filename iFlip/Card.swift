//
//  Card.swift
//  iFlip
//
//  Created by Zennex on 01/03/2020.
//  Copyright © 2020 tamimattafi. All rights reserved.
//

import Foundation


public struct Card {
    
    var isMatched = false
    var isSelected = false
    var isOriginal = true
    let id: Int
    
    init(withId id: Int) {
        self.id = id
    }
    
    class Factory {
        
        private var currentId = -1
        
        private func getUniqueId() -> Int {
            currentId += 1
            return currentId
        }
        
        public func createCard() -> Card {
            return Card(withId: getUniqueId())
        }
        
    }
    
}
