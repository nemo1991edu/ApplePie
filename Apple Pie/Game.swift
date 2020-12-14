//
//  Game.swift
//  Apple Pie
//
//  Created by Apple on 2020-12-13.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var GuessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                GuessedWord += "\(letter)"
            } else {
                GuessedWord += "_"
            }
        }
        
        return GuessedWord
    }
    
    mutating func guessed(letter: Character) {
        guessedLetters.append(letter)
        
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
