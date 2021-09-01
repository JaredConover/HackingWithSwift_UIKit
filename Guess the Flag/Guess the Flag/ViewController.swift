//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Jared Conover on 2021-08-20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var playerScore = 0
    var questionCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This modifies the CALayer property that sits beneath all UIViews
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        // The CALayer doesnt understand UIColor so we need to convert to cgColor
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        if questionCount >= 10 {
            questionCount = 0
            playerScore = 0
        }
        
        countries.shuffle()
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)

        title = "Score: \(playerScore) | "
        title? += countries[correctAnswer].uppercased()
        
        questionCount += 1
        
    }
    
    // This outlet was dragged from IB and then connected to all buttons
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            playerScore += 1
        } else {
            title = "Wrong, that's the flag of \(countries[sender.tag].capitalized)"
            playerScore -= 1
        }
        
        var alertMessage = "Your score is \(playerScore)\n Questions remaining \(10 - questionCount)"
        var alertActionTitle = "Continue"
        
        if questionCount >= 10 {
            alertMessage = "Game Over! \n Final Score: \(playerScore)"
            alertActionTitle = "Play Again"
        }
        
        let alertController = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
    
    
}

