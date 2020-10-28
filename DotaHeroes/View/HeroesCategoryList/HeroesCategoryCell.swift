//
//  HeroesCategoryCell.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 26/10/20.
//

import Foundation
import UIKit

class HeroesCategoryCell: UICollectionViewCell {
    
    var categoryData: String? {
        didSet {
            categoryText.text = categoryData
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let containerCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 10
        
        view.layer.shadowRadius = 3
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
        
        return view
    }()
    
    let categoryText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        return label
    }()
    
    func setupView(){
        contentView.addSubview(containerCell)
        containerCell.addSubview(categoryText)
        
        NSLayoutConstraint.activate([
            containerCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerCell.topAnchor.constraint(equalTo: topAnchor),
            containerCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryText.centerXAnchor.constraint(equalTo: containerCell.centerXAnchor),
            categoryText.topAnchor.constraint(equalTo: containerCell.topAnchor),
            categoryText.bottomAnchor.constraint(equalTo: containerCell.bottomAnchor)
        ])
    }
}
