//
//  ViewController.swift
//  E_iPhone
//
//  Created by Alaa Eid on 12/02/2024.
//

import UIKit
import E_Core

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = SumValues().sum(numbers: [2,2,2,2])

        print(result)
        // Do any additional setup after loading the view.
    }


}

