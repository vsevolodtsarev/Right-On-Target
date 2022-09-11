//
//  ViewController.swift
//  Right On Target
//
//  Created by Всеволод Царев on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var round = 1
    var points = 0
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(number)
    }

    @IBAction func checkNumber() {
            let numSlider = Int(slider.value.rounded())
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(title: "Игра окончена",
                                              message: "Вы заработали \(points) очков",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново",
                                              style: .default,
                                              handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }


