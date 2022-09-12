//
//  ViewController.swift
//  MemberList
//
//  Created by parkhyo on 2022/07/16.
//

import UIKit

final class ViewController: UIViewController {
    
    //테이블뷰
    private let tableView  = UITableView()
    
    var memberListManager = MemberListManager()
    
    
    lazy var plusButton: UIBarButtonItem = {
        let button =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupData()
        setupTableView()
        setupNavi()
        setupTableViewConstraints()
    }
    
    // 테이블 뷰 리로드 - Delegate패턴 사용해서 리로드 필요 없어짐.
//    override func viewWillAppear(_ animated: Bool) {
//        // super 호출 필요.
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    

    func setupNavi() {
        title = "회원 목록"
        
        // 네비게이션바 설정관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 60
        
        // cell 등록
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    
    func setupData() {
        memberListManager.makeMebersListDatas()
    }
    

    //테이블뷰 오토레이아웃 설정
    func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    
    @objc func plusButtonTapped(){
        let detailVC = DetailViewController()
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}


extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 넘어가는 코드
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        let array = memberListManager.getMemberList()
        detailVC.member = array[indexPath.row]
        
    }
   
}


extension ViewController:MemberDelegate {
    func addNewMember(_ member: Member) {
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
}
