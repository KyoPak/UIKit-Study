//
//  DetailViewController.swift
//  MemberList
//
//  Created by parkhyo on 2022/07/16.
//

import UIKit

final class DetailViewController: UIViewController {

    
    private let detailView = DetailView()
    
    
    var member: Member?
    
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
        setupData()
    }
    
    private func setupData(){
        detailView.member = member
    }
    
    
    func setupButtonAction(){
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    
    @objc func saveButtonTapped() {
        print("버튼 클릭")
    }
   
}
