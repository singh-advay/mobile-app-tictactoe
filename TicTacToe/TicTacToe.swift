//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Advay Singh on 10/12/23.
//

import Foundation
struct TicTacToe{
    var XTurn = true
    var board = ["","","","","","","","",""] //board array game state
    var didXWin = false
    var didOWin = false
    var xScore = 0
    var oScore = 0
    var draw = false
    var movesPlayed = 0
    
    func toStringX() -> String
    {
        return String(xScore)
    }
    func toStringO() -> String
    {
        return String(oScore)
    }
    
    mutating func updateBoard(position: Int)
    {
        if (XTurn == true)
        {
            board[position] = "X"
            movesPlayed += 1
            XTurn.toggle() //switches the turn
        }
        else
        {
            board[position] = "O"
            movesPlayed += 1
            XTurn.toggle()
        }
    }
    mutating func drawResult() //sets draw if neither x nor o won
    {
        draw = true
    }
    mutating func whoWin() //calculates all possible win combinations and determines winner
    {
        if (board[0] == board[1] && board[0] == board[2])
        {
            if(board[0] == "X")
            {
                didXWin = true
            }
            else if(board[0] == "O")
            {
               didOWin = true
            }
        }
        else if (board[0] == board[4] && board[0] == board[8])
        {
            if(board[0] == "X")
            {
                didXWin = true
            }
            else if(board[0] == "O")
            {
               didOWin = true
            }
        }
        else if (board[0] == board[3] && board[0] == board[6])
        {
            if(board[0] == "X")
            {
                didXWin = true
            }
            else if(board[0] == "O")
            {
               didOWin = true
            }
        }
        else if (board[1] == board[4] && board[1] == board[7])
        {
            if(board[1] == "X")
            {
                didXWin = true
            }
            else if(board[1] == "O")
            {
               didOWin = true
            }
        }
        else if (board[3] == board[4] && board[3] == board[5])
        {
            if(board[3] == "X")
            {
                didXWin = true
            }
            else if(board[3] == "O")
            {
               didOWin = true
            }
        }
        else if (board[6] == board[7] && board[6] == board[8])
        {
            if(board[6] == "X")
            {
                didXWin = true
            }
            else if(board[6] == "O")
            {
               didOWin = true
            }
        }
        else if (board[2] == board[5] && board[2] == board[8])
        {
            if(board[2] == "X")
            {
                didXWin = true
            }
            else if(board[2] == "O")
            {
               didOWin = true
            }
        }
        else if (board[2] == board[4] && board[2] == board[6])
        {
            if(board[2] == "X")
            {
                didXWin = true
            }
            else if(board[2] == "O")
            {
               didOWin = true
            }
        }
        if (didXWin == true)
        {
            updateXScore()
        }
        else if (didOWin == true)
        {
            updateOScore()
        }
    }
    mutating func updateXScore()
    {
        xScore += 1

    }
    mutating func updateOScore()
    {
        oScore += 1
    }
    mutating func ResetGame()
    {
        XTurn = true
        resetBoard()
        didXWin = false
        didOWin = false
        draw = false
        movesPlayed = 0
    }
    mutating func RestartGame()
    {
        XTurn = true
        resetBoard()
        didXWin = false
        didOWin = false
        xScore = 0
        oScore = 0
        movesPlayed = 0
        draw = false
    }
    mutating func resetBoard()
    {
        for (index, position) in board.enumerated()
        {
            board[index] = ""
        }
    }
    
    
    
}
