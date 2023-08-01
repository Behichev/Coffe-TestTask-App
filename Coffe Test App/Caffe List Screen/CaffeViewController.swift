//
//  CaffeViewController.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 29.07.2023.
//

import UIKit

class CaffeViewController: UIViewController {

    @IBOutlet weak var mapButton: UIBarButtonItem!
    @IBOutlet weak var caffeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDelegates()
        setupUI()
    }
    
    private func registerDelegates() {
        caffeTableView.dataSource = self
        caffeTableView.delegate = self
        caffeTableView.register(UINib(nibName: "CaffeTableViewCell", bundle: nil), forCellReuseIdentifier: "CaffeTableViewCell")
    }
    
    private func setupUI() {
        caffeTableView.separatorStyle = .none
        caffeTableView.showsVerticalScrollIndicator = false
    }

}

extension CaffeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CaffeTableViewCell", for: indexPath) as? CaffeTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

extension CaffeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = CaffeDetailedViewController(nibName: "CaffeDetailedViewController", bundle: nil)
        detailedVC.modalPresentationStyle = .overFullScreen
        navigationController?.present(detailedVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
}
