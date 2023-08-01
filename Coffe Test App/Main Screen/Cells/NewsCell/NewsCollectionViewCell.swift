//
//  NewsCollectionViewCell.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 31.07.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var blurView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        bgView.layer.cornerRadius = 18
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bgView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bgView.addSubview(blurEffectView)
        bgView.bringSubviewToFront(newsTitleLabel)
    }
}
