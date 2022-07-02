//
//  FourthViewController.swift
//  NextVC
//
//  Created by parkhyo on 2022/07/02.
//

import UIKit

class FourthViewController: UIViewController {

    var someString: String?
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
