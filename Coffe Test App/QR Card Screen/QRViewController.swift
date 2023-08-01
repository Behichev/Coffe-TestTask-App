//
//  QRViewController.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 29.07.2023.
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet weak var cashbackPercentLabel: UILabel!
    @IBOutlet weak var bonusesCountLabel: UILabel!
    @IBOutlet weak var qrCodeBackgroundView: UIView!
    @IBOutlet weak var bonusesCountView: UIView!
    @IBOutlet weak var cashbackPercentView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var qrCodeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        cashbackPercentLabel.text = "5%"
        bonusesCountLabel.text = "25"
    }

    private func setupUI() {
        self.view.bringSubviewToFront(backgroundImageView)
        self.view.bringSubviewToFront(qrCodeStackView)
        
        backgroundImageView.layer.cornerRadius = 24
        bonusesCountView.layer.cornerRadius = 24
        cashbackPercentView.layer.cornerRadius = 24
        qrCodeBackgroundView.layer.cornerRadius = 24
    }
}
