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
        
        countries.shuffle()
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            playerScore += 1
        } else {
            title = "Wrong"
            playerScore -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(playerScore)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    
}

