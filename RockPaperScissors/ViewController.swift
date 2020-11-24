//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Gideon Brasil on 2020-11-15.
//

import UIKit

class ViewController: UIViewController {

    var myHand = ""
    let hands = ["👊", "✋", "✌️"]
    let losingHands = ["👊": "✌️", "✋": "👊", "✌️": "✋"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func SelectRock(_ sender: Any) {
        myHand = "👊"
        label.text = "You've selected \(myHand)"
    }
    
    @IBAction func SelectPaper(_ sender: Any) {
        myHand = "✋"
        label.text = "You've selected \(myHand)"
    }
    
    @IBAction func SelectScissors(_ sender: Any) {
        myHand = "✌️"
        label.text = "You've selected \(myHand)"
    }

    func finishGame() {
        let iPhoneHand = hands.randomElement()!
        
        var message = ""
        if iPhoneHand == myHand {
            message = "It's a 👔"
        } else if losingHands[iPhoneHand] == myHand {
            message = "iPhone wins"
        } else {
            message = "You won!! Yay!"
        }
        
        label.text = "You've selected \(myHand)\niPhone selected \(iPhoneHand)\n\(message)"
    }
    
    @IBAction func play(_ sender: Any) {
        
        var counter = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if counter > 0 {
                self.label.text = "You've selected \(self.myHand)\n\(counter)"
            } else {
                Timer.invalidate()
                self.finishGame()
            }
            
            counter -= 1
        }
    }
}

