//
//  ViewController.swift
//  TableView
//
//  Created by parkhyo on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {
    
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // 셀의 높이 설정
        tableView.rowHeight = 120 //스토리보드에서 테이블뷰에서 설정도 가능
        movieDataManager.makeMovieData()
    }

}

extension ViewController: UITableViewDataSource {
    
    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        //indexPath.section : 그룹번호
        //indexPath.row : 그 그룹의 행이라고 생각
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movieDataManager.getMovieData()[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        //cell.selectionStyle = .none
        return cell
    }
}
