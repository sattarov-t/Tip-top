//
//  CalculateViewController.swift
//  TipTop
//
//  Created by Тимур on 15.08.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPrcButton: UIButton!
    @IBOutlet weak var tenPrcButton: UIButton!
    @IBOutlet weak var twentyPrcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberPeople = 2
    var billTotal = 0.0
    var percentage = "0"
    var resultVC = "0"

    @IBAction func tipButton(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPrcButton.isSelected = false
        tenPrcButton.isSelected = false
        twentyPrcButton.isSelected = false
        sender.isSelected = true
        let selectedPercentage = sender.currentTitle
        percentage = selectedPercentage!
  
        
    }
    
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberPeople = Int(sender.value)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            resultVC = resultTo2DecimalPlaces
        }
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = resultVC
            destinationVC.setting = "Делится на \(numberPeople) человека, чаевые \(percentage)."
            
        }
    }
    
}
