//
//  ViewController.swift
//  LoginProject
//
//  Created by parkhyo on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {

    let emailTextFieldview = UIView() // 메모리에 올라갔을 뿐
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()

    }

    func makeUI() {
        emailTextFieldview.backgroundColor = UIColor.darkGray
        
        view.addSubview(emailTextFieldview) // 기존 view에 올려놔야 화면에 표시된다.
        
        // 자동으로 오토레이아웃 잡아주는 기능을 끄는 것⭐️
        emailTextFieldview.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextFieldview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true  // 왼쪽 간격
        
        emailTextFieldview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true // 오른쪽 간격
        
        emailTextFieldview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true // 위와의 간격
         
        emailTextFieldview.heightAnchor.constraint(equalToConstant: 40).isActive = true // 높이를 잡는 것
        
    }
}

