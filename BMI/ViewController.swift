//
//  ViewController.swift
//  BMI
//
//  Created by parkhyo on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력하세요"
        
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
}


extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" { //글자지울때도 포함
            return true  // 문자열이라면 숫자로 변환이 안됨.
        }
        return false
    }
    
    
    // 엔터키 누를 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트 필드를 모두 종료 (키보드 내리기)
        if heightTextField.text != "" && weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {   // 키만 입력되어있다면 다음 텍스트 필드로 넘어가기
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 유저의 터치가 일어날 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
