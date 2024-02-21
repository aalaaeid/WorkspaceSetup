//
//  ViewController.swift
//  E_iPhone
//
//  Created by Alaa Eid on 12/02/2024.
//

import UIKit
import E_Core

class ViewController: UIViewController {

    let numbers = [2,2,2,2]
    
    var qrCode: UIImage? {
        if let img = createQRFromString(str: "https://www.hackingwithswift.com/") {
            let qrImage = UIImage(
                ciImage: img,
                scale: 1.0,
                orientation: UIImage.Orientation.down
            )

            return qrImage
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let result = SumValues().sum(numbers: numbers)
        
        let stringNumbers = numbers.map { String($0) }
        let message = "Sum of \(stringNumbers.joined(separator: "+")) = \(result) calculated using E_Core_sum function"

        let coreUI = E_UIViewController(message: message,
                                        buttonTitle: "Good", buttonColor: .red) { [weak self] in
            guard let self = self, let qrCode = qrCode else { return }
            
            self.showQRAlert(qrImage: qrCode)
        }
        addChild(coreUI)
        view.addSubview(coreUI.view)
        coreUI.view.anchor(top: view.topAnchor,
                           leading: view.leadingAnchor,
                           bottom: view.bottomAnchor,
                           trailing: view.trailingAnchor)
        coreUI.didMove(toParent: self)
       
    }
    
    func showQRAlert(qrImage: UIImage) {
        let menu = QRAlertView(qrImage: qrImage)
        menu.modalPresentationStyle = .custom
        menu.transitioningDelegate = self
        self.present(menu, animated: true, completion: nil)
    }
    private func createQRFromString(str: String) -> CIImage? {
        let stringData = str.data(using: .ascii)
       let filter = CIFilter(name: "CIQRCodeGenerator")
       filter?.setValue(stringData, forKey: "inputMessage")
       filter?.setValue("H", forKey: "inputCorrectionLevel")
       return filter?.outputImage
   }
    



}



extension ViewController: UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let window = UIApplication.shared.windows[0]
        let bottomPadding = window.safeAreaInsets.bottom
        let bottomRatio =  Float((277 + bottomPadding) / UIScreen.main.bounds.height) /// height of the menu  plus bottom padding
        let heightRatio = Float(1 - bottomRatio) /// summtion of top and bottom must equal 1
        return BottomMenuPresentationController(presentedViewController: presented, presenting: presenting, topHeightRatio: heightRatio, bottomHeightRatio: bottomRatio)
    }

}
