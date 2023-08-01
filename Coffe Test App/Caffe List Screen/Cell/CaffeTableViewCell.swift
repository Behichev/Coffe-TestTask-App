//
//  CaffeTableViewCell.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 31.07.2023.
//

import UIKit

class CaffeTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var locationView: UIView!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var caffeImage: UIImageView!
    @IBOutlet weak private var caffeNameLabel: UILabel!
    @IBOutlet weak private var caffeAdressLabel: UILabel!
    @IBOutlet weak private var blurView: UIView!
    @IBOutlet weak private var bgView: UIView!
    @IBOutlet weak private var adressStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        locationView.layer.cornerRadius = 14
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.addSubview(blurEffectView)
        blurView.bringSubviewToFront(adressStackView)
        bgView.layer.cornerRadius = 18
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
