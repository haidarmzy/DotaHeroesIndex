//
//  HeroesListVC.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 25/10/20.
//

import Foundation
import UIKit

protocol HeroesListDelegate {
    func heroesSelected(_ heroes:HeroesModel)
}

class HeroesListVC: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let heroesCellIdentifier: String = "heroesCell"
    var heroesData: [HeroesModel]?
    
    var heroesDelegate: HeroesListDelegate?
    
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
        self.register(HeroesCell.self, forCellWithReuseIdentifier: heroesCellIdentifier)
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
        heroesDelegate?.heroesSelected(heroesData![indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let safeHeroesData = heroesData else {
            return 0
        }
        return safeHeroesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: heroesCellIdentifier, for: indexPath) as! HeroesCell
        cell.heroData = heroesData?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.3, height: collectionView.frame.height * 0.3)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
}
