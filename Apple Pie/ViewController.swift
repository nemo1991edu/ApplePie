//
//  ViewController.swift
//  Apple Pie
//
//  Created by Apple on 2020-12-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["edu", "ecuador", "corona", "colombia", "brazil", "argentina"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
            
        }
        
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
                
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        let character = Character(letter.lowercased())
        currentGame.guessed(letter: character)
        updateGameState()
    }
    
    
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    func updateGameState() {
        if(currentGame.incorrectMovesRemaining == 0) {
            totalLosses += 1
        } else if(currentGame.formattedWord == currentGame.word) {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        var letters = [String]()

        for letter in currentGame.formattedWord {
           letters.append(String(letter))
        }
        
        let _: [String] = currentGame.formattedWord.map{ String($0) }
        let WordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = WordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
}

