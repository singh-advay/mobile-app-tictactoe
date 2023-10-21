//
//  ViewController.swift
//  TicTacToe
//
//  Created by Advar Singh on 10/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TurnLabel: UILabel!
    @IBOutlet var OPlayerScore: UILabel!
    @IBOutlet var XPlayerScore: UILabel!
    @IBOutlet var TicTacToeGrid: UIView!
    @IBOutlet var LetterX: UIImageView!
    @IBOutlet var LetterO: UIImageView!
    var game = TicTacToe()
    @IBOutlet var RestartGameButton: UIButton!
    @IBOutlet var Buttons: [UIButton]! //outlet collection of buttons
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        XScoreReset()
        OScoreReset()
        displayTurn()
        
    }
    
    func XScoreReset() //reset the x-score for the game
    {
        XPlayerScore.text = "0"
    }
    func OScoreReset() //reset o-score
    {
        OPlayerScore.text = "0"
    }
    func displayTurn() //display whose turn it is
    {
        if(game.XTurn == true)
        {
            TurnLabel.text = "Player X, play your move"
        }
        else
        {
            TurnLabel.text = "Player O, play your move"

        }
    }
    func updateUI() {
        // Update the game board buttons
        for (index, button) in Buttons.enumerated() {
            button.setTitle(game.board[index], for: .normal)
            button.isEnabled = game.board[index] == ""
        }
        
        // Update the turn label
        displayTurn()
        
        // Update player scores
        XPlayerScore.text = game.toStringX()
        OPlayerScore.text = game.toStringO()
        //start determing winner after 5 or moves have been played overall
        if (game.movesPlayed >= 5)
        {
            game.whoWin()
            
            if (game.didXWin == true)
            {
                TurnLabel.text = "X Wins"
                XPlayerScore.text = game.toStringX()
                OPlayerScore.text = game.toStringO()
                let seconds = 1.5
                //code to delay the game from clearing the board (stack overflow)
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    // Put your code which should be executed with a delay here
                    self.resetButtons()
                    self.game.ResetGame()
                    self.displayTurn()
                }
                
            }
            if (game.didOWin == true)
            {
                TurnLabel.text = "O Wins"
                XPlayerScore.text = game.toStringX()
                OPlayerScore.text = game.toStringO()
                let seconds = 1.5
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    // Put your code which should be executed with a delay here
                    self.resetButtons()
                    self.game.ResetGame()
                    self.displayTurn()
                }
                
            }
        }
        //draw if board is dull and neither x nor o won
        if (game.movesPlayed >= 9 && game.didXWin == false && game.didOWin == false)
        {
            game.drawResult()
            TurnLabel.text = "Draw, no winner"
            let seconds = 1.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                // Put your code which should be executed with a delay here
                self.resetButtons()
                self.game.ResetGame()
                self.displayTurn()
            }
            
        }
        
    }
    @IBAction func button(_ sender: UIButton) //button action
    {
        let tag = sender.tag
        if tag >= 0 && tag <= game.board.count {
            if game.board[tag] == "" {
                game.updateBoard(position: tag)
                updateUI() // Update the UI after making a move
            }
        }
    }
    
    func resetButtons() //reset all button titles to blank string
    {
        for button in Buttons
        {
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
    }

    @IBAction func RestartGame(_ sender: UIButton) //restart the game completly
    {
        game.RestartGame()
        XScoreReset()
        OScoreReset()
        resetButtons()
        TurnLabel.text = "Player X, play your move"
    }
}

