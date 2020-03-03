//
//  CellController.swift
//  iFlip
//
//  Created by Zennex on 01/03/2020.
//  Copyright © 2020 tamimattafi. All rights reserved.
//

import UIKit

class CellController: UICollectionViewCell {
    
    private var cardIndex: Int? = nil
    
    @IBOutlet weak var word: UILabel!
    
    @IBOutlet weak var root: UIView!
    
    func getCardIndex() -> Int {
        return cardIndex!
    }
    
    func setCardIndex(at index: Int) {
        self.cardIndex = index
    }
    
    func setWord(as word: String) {
        self.word.text = word
    }
    
    func setMatched(is matched: Bool) {
        if matched {
            root.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            setNormalColor()
        }
    }
    
    func setSelected(is selected: Bool) {
        if selected {
            root.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else {
            setNormalColor()
        }
    }
    
    private func setNormalColor() {
        root.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
}
