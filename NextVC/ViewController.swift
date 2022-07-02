//
//  ViewController.swift
//  NextVC
//
//  Created by parkhyo on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 1) 코드로 뷰컨트롤 화면 이동 (다음화면이 코드로만 구성되어있을 때 사용가능)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someString = "코드로 화면 바꾸기"
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {
            return
        }
        secondVC.someString = "코드로 스토리보드 객체를 생성해서 화면 이동"
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toThirdVC" {
            guard let thirdVC = segue.destination as? ThirdViewController else {
                return
            }
            thirdVC.someString = "세그웨이 간접 이동"
        }
        
        // 4) 버튼과 직접 연결하여 세그웨이 이동 (직접이동)
        if segue.identifier == "toFourthVC" {
            guard let fourthVC = segue.destination as? FourthViewController else {
                return
            }
            fourthVC.someString = "세그웨이 직접 이동"
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 4) 실행 여부를 조건문을 통하여 실행 할 수 있다 .
        return true
    }
}

