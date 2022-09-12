//
//  Member.swift
//  MemberList
//
//  Created by parkhyo on 2022/07/16.
//

import UIKit

protocol MemberDelegate: AnyObject { // 클래스만 참조 가능하게 
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member)
}


struct Member {
    
    // 멤버의 (절대적) 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
    
    // 이름이 없다면, 시스템 사람이미지 셋팅
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        // 해당이름으로 이미지가 없다면, 시스템 사람이미지 셋팅
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    
    let memberID: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 생성자 구현
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        // 0 일때는 0 , 0이 아닐때에는 타입저장속성의 절대적 값으로 셋팅
        self.memberID = Member.memberNumbers
        
        // 나머지 저장속성은 외부에서 셋팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성 +1
        Member.memberNumbers += 1
    }
}
