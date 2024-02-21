//
//  E_UIViewController.swift
//  E_Core
//
//  Created by Alaa Eid on 20/02/2024.
//

import UIKit

public class E_UIViewController: UIViewController {

    public init(message: String, buttonTitle: String,
                buttonColor: UIColor, buttonHandler: (() -> Void)?) {
     

        self.message = message
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
        
        super.init(nibName: nil, bundle: nil)
        self.buttonHandler = buttonHandler
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var e_Button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
   var e_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 33, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    var message: String
    var buttonTitle: String
    var buttonColor: UIColor
    var buttonHandler: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.addArrangedSubviews([e_Label, e_Button])
        stackView.anchor(top: nil, leading: view.leadingAnchor,
                         bottom: nil, trailing: view.trailingAnchor,
                         padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        stackView.centerYInSuperview()
        
        e_Button.setTitle(buttonTitle, for: .normal)
        e_Button.setTitleColor(buttonColor, for: .normal)
        e_Button.addTarget(self, action: #selector(e_Action), for: .touchUpInside)
        e_Label.text = message
    }
    

    @objc func e_Action() {
        buttonHandler?()
    }

}
