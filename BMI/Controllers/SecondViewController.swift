//
//  SecondViewController.swift
//  BMI
//
//  Created by parkhyo on 2022/07/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = "\(bmi.value)"
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
        
    }
    
    func configureUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
