//
//  ViewController.swift
//  E_iPad
//
//  Created by Alaa Eid on 12/02/2024.
//

import UIKit
import E_Core

class ViewController: UIViewController {

    let numbers = [2,2,2,2]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
         let result = SumValues().sum(numbers: numbers)
         
         let stringNumbers = numbers.map { String($0) }
         let message = "Sum of \(stringNumbers.joined(separator: "+")) = \(result) calculated using E_Core_sum function"

         let coreUI = E_UIViewController(message: message,
                             buttonTitle: "V.Good", buttonColor: .green){ [weak self] in
             guard let self = self else { return }
             
             print("Button tapped!")
             let splitViewController = UISplitViewController()
             splitViewController.preferredDisplayMode = .automatic
             splitViewController.viewControllers = [
                 UINavigationController(rootViewController: PDFListViewController())
             ]
             
             UIApplication.shared.windows.first?.rootViewController = splitViewController

             
         }
         addChild(coreUI)
         view.addSubview(coreUI.view)
         coreUI.view.anchor(top: view.topAnchor,
                            leading: view.leadingAnchor,
                            bottom: view.bottomAnchor,
                            trailing: view.trailingAnchor)
         coreUI.didMove(toParent: self)
    }


}

