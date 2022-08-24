//
//  MyIDViewController.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/24.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        textFieldDidChanged(textField: emailTextField)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        loginPopup(emailTextField)
    }
}

extension MyIDViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    @objc func textFieldDidChanged(textField :UITextField) {
        if textField.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        return loginPopup(textField)
    }
    
    @objc func loginPopup(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Email"
            return false
        } else if !(textField.text!.contains("@")) {
            let alert = UIAlertController(title: "오류", message: "이메일 형식이 아닙니다.", preferredStyle: .alert)
            let okay = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okay)
            present(alert, animated: true, completion: nil)
            return true
        } else {
            let alert = UIAlertController(title: "로그인 중..", message: "", preferredStyle: .alert)
            let okay = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okay)
            present(alert, animated: true, completion: nil)
            return true
        }
    }
}


