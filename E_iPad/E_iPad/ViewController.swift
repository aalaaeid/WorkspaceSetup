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
             
        
             let pdfListViewController = PDFListViewController()
             let masterNavigationController = UINavigationController(rootViewController: pdfListViewController)
             

             let pdfViewerViewController = PDFViewerViewController()
             let detailNavigationController = UINavigationController(rootViewController: pdfViewerViewController)
             
   
             let splitViewController = UISplitViewController()
             splitViewController.delegate = self
             splitViewController.preferredDisplayMode = .oneBesideSecondary
             splitViewController.viewControllers = [masterNavigationController, detailNavigationController]

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

//MARK: - PDFListDelegate
extension ViewController: PDFListDelegate {
    
    func didTapPdf(name: String) {
        let pdfViewerViewController = PDFViewerViewController()
        pdfViewerViewController.fileName = name
        self.showDetailViewController(pdfViewerViewController, sender: self)
    }
    
    
}

extension ViewController: UISplitViewControllerDelegate {
    
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        print("SHOW!!")
    }
}
