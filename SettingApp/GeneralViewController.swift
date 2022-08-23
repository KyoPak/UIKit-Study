//
//  GeneralViewController.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/23.
//

import UIKit




class GeneralViewController: UIViewController {

    @IBOutlet weak var generalTableView: UITableView!
    var generalModel = [[GeneralModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        setNavi()
        
        generalTableView.dataSource = self
        generalTableView.delegate = self
        generalModel.append([GeneralModel(leftTitle: "정보")])
        
        generalModel.append(
            [GeneralModel(leftTitle: "날짜 및 시간"),
             GeneralModel(leftTitle: "키보드"),
             GeneralModel(leftTitle: "서체"),
             GeneralModel(leftTitle: "언어 및 지역"),
             GeneralModel(leftTitle: "사전")]
        )
        generalModel.append([GeneralModel(leftTitle: "재설정")])
    }
    
    func setNavi() {
        self.title = "일반"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

extension GeneralViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = generalModel[indexPath.section][indexPath.row].leftTitle
        return cell
    }
}

extension GeneralViewController:UITableViewDelegate {
    
}
