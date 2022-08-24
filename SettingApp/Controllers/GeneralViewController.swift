//
//  GeneralViewController.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/23.
//

import UIKit




class GeneralViewController: UIViewController {

    @IBOutlet weak var generalTableView: UITableView!
    var generalModelManager = GeneralModelManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDatas()
        setNavi()
    }
    
    func setupTableView() {
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        generalTableView.dataSource = self
        generalTableView.delegate = self
    }
    
    func setNavi() {
        self.title = "일반"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupDatas() {
        generalModelManager.makeData()
    }
}

extension GeneralViewController: UITableViewDataSource {
    
    // MARK: - Section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModelManager.recieveModelList().count
    }
    
    // MARK: - Row Cell

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModelManager.recieveModelList()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = generalModelManager.recieveModelList()[indexPath.section][indexPath.row].leftTitle
        return cell
    }
}

extension GeneralViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "준비중입니다.", message: nil, preferredStyle: .alert)
        let okay = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okay)
        present(alert, animated: true)
        
    }
}
