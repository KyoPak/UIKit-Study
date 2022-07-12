//
//  ViewController.swift
//  TableView
//
//  Created by parkhyo on 2022/07/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var moviesArray: [Movie] = [
        // 일단 데이터 수기로..
        Movie(movieImage: UIImage(named: "batman.png"), movieName: "배트맨", movieDescription: "배트맨이 출현하는 영화"),
        Movie(movieImage: UIImage(named: "captain.png"), movieName: "캡틴 아메리카", movieDescription: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
        Movie(movieImage: UIImage(named: "ironman.png"), movieName: "아이언맨", movieDescription: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
        Movie(movieImage: UIImage(named: "thor.png"), movieName: "토르", movieDescription: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
        Movie(movieImage: UIImage(named: "hulk.png"), movieName: "헐크", movieDescription: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "스파이더맨", movieDescription: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
        Movie(movieImage: UIImage(named: "blackpanther.png"), movieName: "블랙펜서", movieDescription: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
        Movie(movieImage: UIImage(named: "doctorstrange.png"), movieName: "닥터스트레인지", movieDescription: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
        Movie(movieImage: UIImage(named: "guardians.png"), movieName: "가디언즈 오브 갤럭시", movieDescription: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // 셀의 높이 설정
        tableView.rowHeight = 120 //스토리보드에서 테이블뷰에서 설정도 가능
    }

    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //indexPath.section : 그룹번호
        //indexPath.row : 그 그룹의 행이라고 생각
        
        // 구체적 셀의 형태만들고 리턴
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        
        return cell
    }
    
}

