//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.10
    
    var people = 2
    
    var perPesonPrice = "0.0"
    
    var calculatingTip = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //tipボタンの切り替え
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        //tipボタンの表示
        let buttontitle = sender.currentTitle!
        
        let buttontitleMinusPercent = String(buttontitle.dropLast())
        
        calculatingTip = Double(buttontitleMinusPercent)!
        
        tip = calculatingTip / 100.0 + 1.0
        
        billTextField.endEditing(true)
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let currentNum = String(format: "%.0f", sender.value)
        splitNumberLabel.text = currentNum
        people = Int(currentNum)!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalPrice = Double(billTextField.text ?? "100.00") ?? 100.00 * tip
        perPesonPrice = String(format: "%.2f",totalPrice / Double(people))
        
        performSegue(withIdentifier: "result", sender: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            
            let resultVC = segue.destination as! RessultViewController
            
            resultVC.price = perPesonPrice
            resultVC.tip = Int(calculatingTip)
            resultVC.people = people
            
        }
        
    }
    
    
    
    
    
    
}

