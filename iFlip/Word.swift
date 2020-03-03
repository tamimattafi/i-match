//
//  Word.swift
//  iFlip
//
//  Created by Zennex on 01/03/2020.
//  Copyright © 2020 tamimattafi. All rights reserved.
//

import Foundation


struct Word {
    
    public let original: String
    public let translation: String
    
    public var id = -1
    
    
    class Facotry  {
        
        private var words: [Word] = [
            Word(original: "Hi", translation: "Провет"),
            Word(original: "Boy", translation: "Мальчик"),
            Word(original: "Water", translation: "Вода"),
            Word(original: "Snow", translation: "Снег"),
            Word(original: "Food", translation: "Еда"),
            Word(original: "City", translation: "Город"),
            Word(original: "Girl", translation: "Девочка"),
            Word(original: "Woman", translation: "Женшина"),
            Word(original: "House", translation: "Дом"),
            Word(original: "University", translation: "Университет"),
            Word(original: "Car", translation: "Машина"),
            Word(original: "Work", translation: "Работа"),
            Word(original: "Computer", translation: "Компютер"),
            Word(original: "Rain", translation: "Дождь"),
            Word(original: "Cold", translation: "Холод"),
        ]
        
        public func getRandom(withId id: Int) -> Word? {
            if words.isEmpty {
                return nil
            } else {
                words.shuffle()
                var word = words.removeFirst()
                word.id = id
                return word
            }
        }
        
    }
}
