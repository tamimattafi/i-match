//
//  Matcher.swift
//  iFlip
//
//  Created by Zennex on 01/03/2020.
//  Copyright © 2020 tamimattafi. All rights reserved.
//

import Foundation


class Matcher {
    
    private var cards: [Card] = [Card]()
    private var words: [Word] = [Word]()
    
    private let wordsFactory = Word.Facotry()
    private let cardsFactory = Card.Factory()
    
    private var currentSelectedCardIndex: Int? {
        return cards.firstIndex { (card) -> Bool in card.isSelected && !card.isMatched }
    }
    
    private var onCardDataChanged: ((_ cardIndex: Int) -> Void)?
    private var onNewMatchSuccess: ((_ matchingPercentange: Int) -> Void)?
    private var onNewMatchFailure: (() -> Void)?
    
    private var matchingPercentage: Int {
        return cards.filter { (card) -> Bool in
            card.isMatched
        }.count * 100 / cards.count
    }
    
    public var actualPairsCount: Int {
        return cards.count
    }
    
    public func setCardDataChangeListener(onCardDataChanged: @escaping (_ cardIndex: Int) -> Void) {
        self.onCardDataChanged = onCardDataChanged
    }
    
    public func setNewMatchSuccessListener(onNewMatchSuccess: @escaping (_ matchingPercentage: Int) -> Void) {
        self.onNewMatchSuccess = onNewMatchSuccess
    }
    
    public func setNewMatchFailureListener(onNewMatchFailure: @escaping () -> Void) {
        self.onNewMatchFailure = onNewMatchFailure
    }
    
    public func isCardMatched(atIndex index: Int) -> Bool {
        return cards[index].isMatched
    }
    
    public func isCardSelected(atIndex index: Int) -> Bool {
        return cards[index].isSelected
    }
    
    public func chooseCard(atIndex index: Int) {
        if currentSelectedCardIndex == nil {
            selectCard(at: index)
        } else if currentSelectedCardIndex != index && !cards[index].isMatched {
            tryMatchingCards(forNewIndex: index)
        } else if cards[index].isSelected {
            deselectCard(at: index)
        }
    }
    
    public func getWord(forCardIndex index: Int) -> String {
        let word = words.first(where: { (word) -> Bool in
            cards[index].id == word.id
        })!
                
        if cards[index].isOriginal {
            return word.original
        } else {
            return word.translation
        }
    }
    
    public init(withPairsCount count: Int) {
        for _ in 0..<count {
            var card = cardsFactory.createCard()
            let word = wordsFactory.getRandom(withId: card.id)
            if word != nil {appendData(card: &card, word: word!) }
        }
        
        cards.shuffle()
    }
    
    private func tryMatchingCards(forNewIndex newIdenx: Int) {
        if cards[currentSelectedCardIndex!].id == cards[newIdenx].id {
            matchCards(forNewIndex: newIdenx)
        } else {
            deselectCard(at: currentSelectedCardIndex!)
            onNewMatchFailure?()
        }
    }
    
    private func matchCards(forNewIndex newIndex: Int) {
        let oldIndex = currentSelectedCardIndex!
        cards[newIndex].isMatched = true
        cards[oldIndex].isMatched = true
        onNewMatchSuccess?(matchingPercentage)
        onCardDataChanged?(newIndex)
        onCardDataChanged?(oldIndex)
    }
    
    private func selectCard(at index: Int) {
        cards[index].isSelected = true
        onCardDataChanged?(index)
    }
    
    private func deselectCard(at index: Int) {
        cards[index].isSelected = false
        onCardDataChanged?(index)
    }
    
    private func appendData(card: inout Card, word: Word) {
        cards.append(card)
        card.isOriginal = false
        cards.append(card)
        words.append(word)
    }

}
