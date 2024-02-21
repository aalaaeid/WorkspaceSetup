//
//  QRAlertView.swift
//  E_iPhone
//
//  Created by Support on 21/02/2024.
//

import UIKit

class QRAlertView: UIViewController {

    
    public init(qrImage: UIImage) {
        self.qrImage = qrImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var qrImage: UIImage
    
    var qrImageView: UIImageView = {
         let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
         return imageView
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(qrImageView)
        qrImageView.anchor(top: view.topAnchor,
                           leading: view.leadingAnchor,
                           bottom: view.safeAreaLayoutGuide.bottomAnchor,
                           trailing: view.trailingAnchor,
                           padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        qrImageView.image = qrImage
       
    }

}



