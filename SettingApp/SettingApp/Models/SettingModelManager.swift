//
//  SettingModelManager.swift
//  SettingApp
//
//  Created by parkhyo on 2022/08/24.
//

import Foundation

final class SettingModelManager {
    
    var settingModelList = [[SettingModel]]()
    
    func makeData() {
        settingModelList.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "iPhone에 로그인하세요.", subTitle: "아이클라우드를 설정하세요.", rightImageView: "chevron.right")]
        )
        settingModelList.append(
        [SettingModel(leftImageName: "gear", menuTitle: "일반", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "faceid", menuTitle: "Face ID 및 암호", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "개인 정보 보호", subTitle: nil, rightImageView: "chevron.right"),
        SettingModel(leftImageName: "battery.100", menuTitle: "배터리", subTitle: nil, rightImageView: "chevron.right")]
        )
    }
    
    func recieveModelList() -> [[SettingModel]] {
        return settingModelList
    }
}
