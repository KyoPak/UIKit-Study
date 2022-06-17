//
//  ViewController.swift
//  TextFieldProject
//
//  Created by parkhyo on 2022/06/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

