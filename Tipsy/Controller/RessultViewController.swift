//
//  RessultViewController.swift
//  Tipsy
//
//  Created by Kenta on 2020/12/29.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class RessultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var price: String?
    var tip: Int?
    var people: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = price
        settingsLabel.text = "Split between \(people ?? 2) people, with \(tip ?? 0)% tip."
        
    }
    

   
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
