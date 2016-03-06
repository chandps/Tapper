//
//  ViewController.swift
//  Tapper
//
//  Created by Chandra Prasetya S on 3/6/16.
//  Copyright © 2016 chandps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tapperImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var coinButton: UIButton!
    
    @IBOutlet weak var coinLabel: UILabel!
    
    // MARK: - Model
    var coin: Int? {
        didSet {
            if let newCoin = coin {
            coinLabel.text = "\(newCoin)"
                if newCoin < 1 {
                    showGameOverAlert()
                    gameState = "Main menu"
                    coin = nil
                }
            }
        }
    }
    
    var gameState: String? {
        didSet {
            toggleHideButton()
        }
    }
    // MARK: - Action outlets
    @IBAction func startGame() {
        if let newCoin = textField.text{
            if let intCoin = Int(newCoin) {
                playGame(intCoin)
            }
        }
    }
    
    @IBAction func tapCoin() {
        if coin != 0 {
            coin = coin! - 1
        }
    }
    
    // MARK: - Private implementation
    func playGame(forCoin: Int) {
        if forCoin > 0 {
            coin = forCoin
            gameState = "Playing"
        }
    }
    
    func toggleHideButton() {
        tapperImage.hidden = !tapperImage.hidden
        playButton.hidden = !playButton.hidden
        textField.hidden = !textField.hidden
        coinButton.hidden = !coinButton.hidden
        coinLabel.hidden = !coinLabel.hidden
    }
    
    func showGameOverAlert() {
        let alert = UIAlertController(title: "Congratulation!", message: "You have successfully tapped the coins until gone!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Play again", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.playGame(Int(self.textField.text!)!)
        })
        alert.addAction(UIAlertAction(title: "New game", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}

