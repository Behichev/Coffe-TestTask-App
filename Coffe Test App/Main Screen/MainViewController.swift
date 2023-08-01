//
//  ViewController.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 29.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var welcomeUser = "Welcome, "
    override func viewDidLoad() {
        super.viewDidLoad()
        //                delegates()
        var userName = "Ivan"
        welcomeUser += userName
        var attributedStr = NSMutableAttributedString(string: welcomeUser)
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "textPurple"), range: NSRange(location: 9, length: userName.count))
        titleLabel.attributedText = attributedStr
    }
    
    private func delegates() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }
    
    private func createQRCardLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension:
                        .fractionalWidth(1),
                heightDimension:
                        .fractionalWidth(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                              heightDimension: .fractionalHeight(1)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        return section
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) as?
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}
