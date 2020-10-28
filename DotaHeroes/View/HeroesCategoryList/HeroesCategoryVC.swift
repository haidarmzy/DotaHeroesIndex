//
//  HeroesCategoryVC.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 26/10/20.
//

import Foundation
import UIKit

protocol HeroesCategoryDelegate {
    func categorySelected(_ category:String)
}

class HeroesCategoryVC: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var categoryDelegate: HeroesCategoryDelegate?
    let categoryCellIdentifier: String = "categoryCell"
    let categoryData: Array<String> = [
        "All",
        "Carry",
        "Nuker",
        "Initiator",
        "Disabler",
        "Durable",
        "Escape",
        "Support",
        "Pusher",
        "Jungler"
    ]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.scrollDirection = .vertical
        super.init(frame: frame, collectionViewLayout: layoutFlow)
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
        self.register(HeroesCategoryCell.self, forCellWithReuseIdentifier: categoryCellIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        self.collectionViewLayout.collectionView?.showsVerticalScrollIndicator = true
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryDelegate?.categorySelected(categoryData[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellIdentifier, for: indexPath) as! HeroesCategoryCell
        cell.categoryData = categoryData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: 50)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
}
