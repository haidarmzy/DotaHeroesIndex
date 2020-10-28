//
//  HeroesCell.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 25/10/20.
//

import Foundation
import UIKit
import Kingfisher

class HeroesCell: UICollectionViewCell {
    
    var heroData: HeroesModel? {
        didSet{
            guard let data = heroData else { return }
            let imgURL = "https://api.opendota.com\(data.img)"
            let imageURL = URL(string: imgURL)
            heroName.text = data.localized_name
            heroImage.kf.setImage(with: imageURL)
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
        return view
    }()
    
    let heroImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image_test"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let heroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Void Spirit"
        return label
    }()
    
    
    func setupView(){
        contentView.addSubview(containerCell)
        containerCell.addSubview(heroImage)
        containerCell.addSubview(heroName)
        
        NSLayoutConstraint.activate([
            containerCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerCell.topAnchor.constraint(equalTo: topAnchor),
            containerCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            heroImage.widthAnchor.constraint(equalTo: containerCell.widthAnchor),
            heroImage.heightAnchor.constraint(equalTo: containerCell.heightAnchor, multiplier: 0.8),
            heroImage.topAnchor.constraint(equalTo: containerCell.topAnchor),
            
            heroName.topAnchor.constraint(equalTo: heroImage.bottomAnchor),
            heroName.bottomAnchor.constraint(equalTo: containerCell.bottomAnchor),
            heroName.centerXAnchor.constraint(equalTo: containerCell.centerXAnchor)
        ])
    }
}
