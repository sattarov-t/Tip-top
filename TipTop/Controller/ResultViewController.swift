//
//  ResultViewController.swift
//  TipTop
//
//  Created by Тимур on 15.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var setting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = setting
    }
    

    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
