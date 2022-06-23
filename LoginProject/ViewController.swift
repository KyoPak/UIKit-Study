//
//  ViewController.swift
//  LoginProject
//
//  Created by parkhyo on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldview: UIView = { // 오토레이아웃 까지는 못잡아주고 초기셋팅만 가능.
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
//        view.addSubview(emailTextField)
//        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // "이메일 또는 전화번호" 안내문구
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    // 로그인 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
       var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()

    }

    func makeUI() {
        
        view.addSubview(emailTextFieldview) // 기존 view에 올려놔야 화면에 표시된다.
        
        // 자동으로 오토레이아웃 잡아주는 기능을 끄는 것⭐️
        emailTextFieldview.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextFieldview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true  // 왼쪽 간격
        
        emailTextFieldview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true // 오른쪽 간격
        
        emailTextFieldview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true // 위와의 간격
         
        emailTextFieldview.heightAnchor.constraint(equalToConstant: 40).isActive = true // 높이를 잡는 것
        
    }
}

