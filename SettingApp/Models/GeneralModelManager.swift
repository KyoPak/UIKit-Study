//
//  DetailModelManager.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/24.
//

import Foundation

final class GeneralModelManager {
    
    var generalModelList = [[GeneralModel]]()
    
    func makeData() {
        generalModelList.append([GeneralModel(leftTitle: "정보")])
        
        generalModelList.append(
            [GeneralModel(leftTitle: "날짜 및 시간"),
             GeneralModel(leftTitle: "키보드"),
             GeneralModel(leftTitle: "서체"),
             GeneralModel(leftTitle: "언어 및 지역"),
             GeneralModel(leftTitle: "사전")]
        )
        generalModelList.append([GeneralModel(leftTitle: "재설정")])
    }
    
    func recieveModelList() -> [[GeneralModel]]{
        return generalModelList
    }
    
}
