//
//  PDFViewerViewController.swift
//  E_iPad
//
//  Created by Support on 21/02/2024.
//

import UIKit
import WebKit

class PDFViewerViewController: UIViewController {

    var fileName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        
        view.addSubview(webView)
        webView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: view.leadingAnchor,
                       bottom: view.safeAreaLayoutGuide.bottomAnchor,
                       trailing: view.trailingAnchor)
        
        guard let urlPath = Bundle.main.url(forResource: fileName, withExtension: "pdf") else { return }

        webView.load(URLRequest(url: urlPath))
        

    }




}
