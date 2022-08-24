//
//  ViewController.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    var settingModelManager = SettingModelManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatas()
        setupTableView()
        setNavi()
    }
    
    func setNavi() {
        title = "설정"
        self.view.backgroundColor = UIColor(white: 245/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
    
    func setupDatas() {
        settingModelManager.makeData()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let myidVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myidVC, animated: true, completion: nil)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as! GeneralViewController
            
            self.navigationController?.pushViewController(generalVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}

extension ViewController: UITableViewDataSource {

    // MARK: - Section

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModelManager.recieveModelList().count
    }
    
    // MARK: - Row Cell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModelManager.recieveModelList()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            cell.topTitle.text = settingModelManager.recieveModelList()[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModelManager.recieveModelList()[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModelManager.recieveModelList()[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModelManager.recieveModelList()[indexPath.section][indexPath.row].leftImageName)
        cell.middleTitle.text = settingModelManager.recieveModelList()[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModelManager.recieveModelList()[indexPath.section][indexPath.row].rightImageView ?? "")
        
        return cell
    }
}

