//
//  PDFListViewController.swift
//  E_iPad
//
//  Created by Support on 21/02/2024.
//

import UIKit

protocol PDFListDelegate: AnyObject {
    func didTapPdf(name: String)
}

class PDFListViewController: UIViewController {

    @IBOutlet weak var pdfTableView: UITableView!

    weak var delegate: PDFListDelegate?
    var pdfs = ["pdf-test", "dummy", "sample"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        pdfTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        pdfTableView.dataSource = self
        pdfTableView.delegate = self
    }



}


extension PDFListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pdf = pdfs[indexPath.row]
        delegate?.didTapPdf(name: pdf)
    }

}

extension PDFListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pdfs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pdfs[indexPath.row]
        return cell
    }
    
    
    
}
