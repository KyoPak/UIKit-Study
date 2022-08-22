//
//  ViewController.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {

    var settingModel = [[SettingModel]]()
    
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "iPhone에 로그인하세요.", subTitle: "아이클라우드를 설정하세요.", rightImageView: "chevron.right")]
        )
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "일반", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "faceid", menuTitle: "Face ID 및 암호", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "개인 정보 보호", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "battery.100", menuTitle: "배터리", subTitle: nil, rightImageView: "chevron.right")]
        )
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        makeData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageView ?? "")
        
        return cell
    }
    
    
}

