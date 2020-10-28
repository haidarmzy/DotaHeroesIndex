//
//  HeroDetail.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 26/10/20.
//

import Foundation
import UIKit
import Kingfisher

class HeroDetail: UIViewController {
    
    var heroDetailData: HeroesModel?{
        didSet{
            guard let data = heroDetailData else { return }
            let imgURL = "https://api.opendota.com\(data.img)"
            let imageURL = URL(string: imgURL)
            heroName.text = data.localized_name
            heroImage.kf.setImage(with: imageURL)
            heroRolesText.text = data.roles.joined(separator: ", ")
            attackText.text = "\(data.base_attack_min ?? 0) - \(data.base_attack_max ?? 0)"
            healthText.text = "\(data.base_health ?? 0)"
            defText.text = "\(data.base_armor ?? 0)"
            manaText.text = "\(data.base_mana ?? 0)"
            speedText.text = "\(data.move_speed ?? 0)"
            typeText.text = data.primary_attr
        }
    }
    
    var highestStatData: [HeroesModel]? {
        didSet{
            guard let data = highestStatData else { return }
            var imgURL1: String = ""
            var imgURL2: String = ""
            var imgURL3: String = ""
            if data[0].id == heroDetailData?.id {
                imgURL1 = "https://api.opendota.com\(data[1].img)"
                imgURL2 = "https://api.opendota.com\(data[2].img)"
                imgURL3 = "https://api.opendota.com\(data[3].img)"
            } else if data[1].id == heroDetailData?.id {
                imgURL1 = "https://api.opendota.com\(data[0].img)"
                imgURL2 = "https://api.opendota.com\(data[2].img)"
                imgURL3 = "https://api.opendota.com\(data[3].img)"
            } else if data[2].id == heroDetailData?.id {
                imgURL1 = "https://api.opendota.com\(data[0].img)"
                imgURL2 = "https://api.opendota.com\(data[1].img)"
                imgURL3 = "https://api.opendota.com\(data[3].img)"
            } else {
                imgURL1 = "https://api.opendota.com\(data[0].img)"
                imgURL2 = "https://api.opendota.com\(data[1].img)"
                imgURL3 = "https://api.opendota.com\(data[2].img)"
            }
            
            let imageURL1 = URL(string: imgURL1)
            let imageURL2 = URL(string: imgURL2)
            let imageURL3 = URL(string: imgURL3)

            similiarHeroImage1.kf.setImage(with: imageURL1)
            similiarHeroImage2.kf.setImage(with: imageURL2)
            similiarHeroImage3.kf.setImage(with: imageURL3)
        }
    }
    
    let heroDetailContainerTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heroSuggestionContainerBottom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatarHeroContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statsContainer: UIView = {
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
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    let labelRoles: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Roles :"
        return label
    }()
    
    let heroRolesText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let heroStatsVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 5.0
        return stack
    }()
    
    let heroStatsHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 2.0
        return stack
    }()
    
    let heroStatsHorizontalStackView2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 5.0
        return stack
    }()
    
    let heroStatsHorizontalStackView3: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 2.0
        return stack
    }()
    
    let containerAttackStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconAttack: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_attack"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let attackText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "85"
        return label
    }()
    
    let containerHealthStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconHealth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_health"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let healthText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "450"
        return label
    }()
    
    let containerDefStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconDef: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_def"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let defText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let containerManaStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconMana: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_mana"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let manaText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let containerSpeedStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconSpeed: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_speed"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let speedText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let containerTypeStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconType: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_type"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let typeText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let similiarHeroText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.text = "Similiar Heroes"
        return label
    }()
    
    let containerSimiliarHero: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 2.0
        return stack
    }()
    
    let viewSimiliarHero1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let similiarHeroImage1: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image_test"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let viewSimiliarHero2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let similiarHeroImage2: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image_test"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let viewSimiliarHero3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let similiarHeroImage3: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image_test"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(heroDetailContainerTop)
        view.addSubview(heroSuggestionContainerBottom)
        
        heroDetailContainerTop.addSubview(avatarHeroContainer)
        heroDetailContainerTop.addSubview(statsContainer)
        
        avatarHeroContainer.addSubview(heroImage)
        avatarHeroContainer.addSubview(heroName)
        avatarHeroContainer.addSubview(labelRoles)
        avatarHeroContainer.addSubview(heroRolesText)
        
        statsContainer.addSubview(heroStatsVerticalStackView)
        heroStatsVerticalStackView.addArrangedSubview(heroStatsHorizontalStackView)
        heroStatsVerticalStackView.addArrangedSubview(heroStatsHorizontalStackView2)
        heroStatsVerticalStackView.addArrangedSubview(heroStatsHorizontalStackView3)
        heroStatsHorizontalStackView.addArrangedSubview(containerAttackStats)
        heroStatsHorizontalStackView.addArrangedSubview(containerHealthStats)
        heroStatsHorizontalStackView2.addArrangedSubview(containerDefStats)
        heroStatsHorizontalStackView2.addArrangedSubview(containerManaStats)
        heroStatsHorizontalStackView3.addArrangedSubview(containerSpeedStats)
        heroStatsHorizontalStackView3.addArrangedSubview(containerTypeStats)
        
        containerAttackStats.addSubview(iconAttack)
        containerAttackStats.addSubview(attackText)
        
        containerHealthStats.addSubview(iconHealth)
        containerHealthStats.addSubview(healthText)
        
        containerDefStats.addSubview(iconDef)
        containerDefStats.addSubview(defText)

        containerManaStats.addSubview(iconMana)
        containerManaStats.addSubview(manaText)

        containerSpeedStats.addSubview(iconSpeed)
        containerSpeedStats.addSubview(speedText)

        containerTypeStats.addSubview(iconType)
        containerTypeStats.addSubview(typeText)
        
        heroSuggestionContainerBottom.addSubview(similiarHeroText)
        heroSuggestionContainerBottom.addSubview(containerSimiliarHero)
        
        containerSimiliarHero.addArrangedSubview(viewSimiliarHero1)
        containerSimiliarHero.addArrangedSubview(viewSimiliarHero2)
        containerSimiliarHero.addArrangedSubview(viewSimiliarHero3)

        viewSimiliarHero1.addSubview(similiarHeroImage1)

        viewSimiliarHero2.addSubview(similiarHeroImage2)

        viewSimiliarHero3.addSubview(similiarHeroImage3)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            heroDetailContainerTop.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            heroDetailContainerTop.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            heroDetailContainerTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            heroDetailContainerTop.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroDetailContainerTop.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            heroSuggestionContainerBottom.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            heroSuggestionContainerBottom.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            heroSuggestionContainerBottom.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heroSuggestionContainerBottom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroSuggestionContainerBottom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            avatarHeroContainer.widthAnchor.constraint(equalTo: heroDetailContainerTop.widthAnchor, multiplier: 0.35),
            avatarHeroContainer.heightAnchor.constraint(equalTo: heroDetailContainerTop.heightAnchor),
            avatarHeroContainer.leadingAnchor.constraint(equalTo: heroDetailContainerTop.leadingAnchor),
            avatarHeroContainer.trailingAnchor.constraint(equalTo: statsContainer.leadingAnchor),
            
            statsContainer.widthAnchor.constraint(equalTo: heroDetailContainerTop.widthAnchor, multiplier: 0.65),
            statsContainer.heightAnchor.constraint(equalTo: heroDetailContainerTop.heightAnchor),
            statsContainer.leadingAnchor.constraint(equalTo: avatarHeroContainer.trailingAnchor),
            statsContainer.trailingAnchor.constraint(equalTo: heroDetailContainerTop.trailingAnchor),
            
            heroImage.widthAnchor.constraint(equalTo: avatarHeroContainer.widthAnchor, multiplier: 0.8),
            heroImage.heightAnchor.constraint(equalTo: avatarHeroContainer.heightAnchor, multiplier: 0.5),
            heroImage.centerXAnchor.constraint(equalTo: avatarHeroContainer.centerXAnchor),
            heroImage.topAnchor.constraint(equalTo: avatarHeroContainer.topAnchor),
            
            heroName.topAnchor.constraint(equalTo: heroImage.bottomAnchor),
            heroName.centerXAnchor.constraint(equalTo: avatarHeroContainer.centerXAnchor),
            
            labelRoles.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 15),
            labelRoles.centerXAnchor.constraint(equalTo: avatarHeroContainer.centerXAnchor),
            
            heroRolesText.topAnchor.constraint(equalTo: labelRoles.bottomAnchor, constant: 5),
            heroRolesText.leadingAnchor.constraint(equalTo: avatarHeroContainer.leadingAnchor, constant: 10),
            heroRolesText.trailingAnchor.constraint(equalTo: avatarHeroContainer.trailingAnchor, constant: -10),
            
            heroStatsVerticalStackView.widthAnchor.constraint(equalTo: statsContainer.widthAnchor),
            heroStatsVerticalStackView.heightAnchor.constraint(equalTo: statsContainer.heightAnchor),
            
            heroStatsHorizontalStackView.leadingAnchor.constraint(equalTo: heroStatsVerticalStackView.leadingAnchor),
            heroStatsHorizontalStackView.trailingAnchor.constraint(equalTo: heroStatsVerticalStackView.trailingAnchor),
            
            heroStatsHorizontalStackView2.leadingAnchor.constraint(equalTo: heroStatsVerticalStackView.leadingAnchor),
            heroStatsHorizontalStackView2.trailingAnchor.constraint(equalTo: heroStatsVerticalStackView.trailingAnchor),

            heroStatsHorizontalStackView3.leadingAnchor.constraint(equalTo: heroStatsVerticalStackView.leadingAnchor),
            heroStatsHorizontalStackView3.trailingAnchor.constraint(equalTo: heroStatsVerticalStackView.trailingAnchor),
            
            containerAttackStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView.topAnchor),
            containerAttackStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView.bottomAnchor),
            
            iconAttack.centerYAnchor.constraint(equalTo: containerAttackStats.centerYAnchor),
            iconAttack.leadingAnchor.constraint(equalTo: containerAttackStats.leadingAnchor),
            iconAttack.trailingAnchor.constraint(equalTo: attackText.leadingAnchor),
            iconAttack.widthAnchor.constraint(equalTo: containerAttackStats.widthAnchor, multiplier: 0.3),
            iconAttack.heightAnchor.constraint(equalToConstant: 50),
            
            attackText.centerYAnchor.constraint(equalTo: containerAttackStats.centerYAnchor),
            attackText.leadingAnchor.constraint(equalTo: iconAttack.trailingAnchor),
            attackText.topAnchor.constraint(equalTo: containerAttackStats.topAnchor),
            attackText.bottomAnchor.constraint(equalTo: containerAttackStats.bottomAnchor),
            attackText.trailingAnchor.constraint(equalTo: containerAttackStats.trailingAnchor),
            attackText.widthAnchor.constraint(equalTo: containerAttackStats.widthAnchor, multiplier: 0.7),
            
            containerHealthStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView.topAnchor),
            containerHealthStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView.bottomAnchor),
            
            iconHealth.centerYAnchor.constraint(equalTo: containerHealthStats.centerYAnchor),
            iconHealth.leadingAnchor.constraint(equalTo: containerHealthStats.leadingAnchor),
            iconHealth.trailingAnchor.constraint(equalTo: healthText.leadingAnchor),
            iconHealth.widthAnchor.constraint(equalTo: containerHealthStats.widthAnchor, multiplier: 0.3),
            iconHealth.heightAnchor.constraint(equalToConstant: 50),
            
            healthText.centerYAnchor.constraint(equalTo: containerHealthStats.centerYAnchor),
            healthText.leadingAnchor.constraint(equalTo: iconHealth.trailingAnchor),
            healthText.topAnchor.constraint(equalTo: containerHealthStats.topAnchor),
            healthText.bottomAnchor.constraint(equalTo: containerHealthStats.bottomAnchor),
            healthText.trailingAnchor.constraint(equalTo: containerHealthStats.trailingAnchor),
            healthText.widthAnchor.constraint(equalTo: containerHealthStats.widthAnchor, multiplier: 0.7),
            
            containerDefStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView2.topAnchor),
            containerDefStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView2.bottomAnchor),
            
            iconDef.centerYAnchor.constraint(equalTo: containerDefStats.centerYAnchor),
            iconDef.leadingAnchor.constraint(equalTo: containerDefStats.leadingAnchor),
            iconDef.trailingAnchor.constraint(equalTo: defText.leadingAnchor),
            iconDef.widthAnchor.constraint(equalTo: containerDefStats.widthAnchor, multiplier: 0.3),
            iconDef.heightAnchor.constraint(equalToConstant: 50),
            
            defText.centerYAnchor.constraint(equalTo: containerDefStats.centerYAnchor),
            defText.leadingAnchor.constraint(equalTo: iconDef.trailingAnchor),
            defText.topAnchor.constraint(equalTo: containerDefStats.topAnchor),
            defText.bottomAnchor.constraint(equalTo: containerDefStats.bottomAnchor),
            defText.trailingAnchor.constraint(equalTo: containerDefStats.trailingAnchor),
            defText.widthAnchor.constraint(equalTo: containerDefStats.widthAnchor, multiplier: 0.7),
            
            containerManaStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView2.topAnchor),
            containerManaStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView2.bottomAnchor),
            
            iconMana.centerYAnchor.constraint(equalTo: containerManaStats.centerYAnchor),
            iconMana.leadingAnchor.constraint(equalTo: containerManaStats.leadingAnchor),
            iconMana.trailingAnchor.constraint(equalTo: manaText.leadingAnchor),
            iconMana.widthAnchor.constraint(equalTo: containerManaStats.widthAnchor, multiplier: 0.3),
            iconMana.heightAnchor.constraint(equalToConstant: 50),
            
            manaText.centerYAnchor.constraint(equalTo: containerManaStats.centerYAnchor),
            manaText.leadingAnchor.constraint(equalTo: iconMana.trailingAnchor),
            manaText.topAnchor.constraint(equalTo: containerManaStats.topAnchor),
            manaText.bottomAnchor.constraint(equalTo: containerManaStats.bottomAnchor),
            manaText.trailingAnchor.constraint(equalTo: containerManaStats.trailingAnchor),
            manaText.widthAnchor.constraint(equalTo: containerManaStats.widthAnchor, multiplier: 0.7),
            
            containerSpeedStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView3.topAnchor),
            containerSpeedStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView3.bottomAnchor),
            
            iconSpeed.centerYAnchor.constraint(equalTo: containerSpeedStats.centerYAnchor),
            iconSpeed.leadingAnchor.constraint(equalTo: containerSpeedStats.leadingAnchor),
            iconSpeed.trailingAnchor.constraint(equalTo: speedText.leadingAnchor),
            iconSpeed.widthAnchor.constraint(equalTo: containerSpeedStats.widthAnchor, multiplier: 0.3),
            iconSpeed.heightAnchor.constraint(equalToConstant: 50),
            
            speedText.centerYAnchor.constraint(equalTo: containerSpeedStats.centerYAnchor),
            speedText.leadingAnchor.constraint(equalTo: iconSpeed.trailingAnchor),
            speedText.topAnchor.constraint(equalTo: containerSpeedStats.topAnchor),
            speedText.bottomAnchor.constraint(equalTo: containerSpeedStats.bottomAnchor),
            speedText.trailingAnchor.constraint(equalTo: containerSpeedStats.trailingAnchor),
            speedText.widthAnchor.constraint(equalTo: containerSpeedStats.widthAnchor, multiplier: 0.7),
            
            containerTypeStats.topAnchor.constraint(equalTo: heroStatsHorizontalStackView3.topAnchor),
            containerTypeStats.bottomAnchor.constraint(equalTo: heroStatsHorizontalStackView3.bottomAnchor),
            
            iconType.centerYAnchor.constraint(equalTo: containerTypeStats.centerYAnchor),
            iconType.leadingAnchor.constraint(equalTo: containerTypeStats.leadingAnchor),
            iconType.trailingAnchor.constraint(equalTo: typeText.leadingAnchor),
            iconType.widthAnchor.constraint(equalTo: containerTypeStats.widthAnchor, multiplier: 0.3),
            iconType.heightAnchor.constraint(equalToConstant: 50),
            
            typeText.centerYAnchor.constraint(equalTo: containerTypeStats.centerYAnchor),
            typeText.leadingAnchor.constraint(equalTo: iconType.trailingAnchor),
            typeText.topAnchor.constraint(equalTo: containerTypeStats.topAnchor),
            typeText.bottomAnchor.constraint(equalTo: containerTypeStats.bottomAnchor),
            typeText.trailingAnchor.constraint(equalTo: containerTypeStats.trailingAnchor),
            typeText.widthAnchor.constraint(equalTo: containerTypeStats.widthAnchor, multiplier: 0.7),
            
            similiarHeroText.widthAnchor.constraint(equalTo: heroSuggestionContainerBottom.widthAnchor, multiplier: 0.3),
            similiarHeroText.heightAnchor.constraint(equalTo: heroSuggestionContainerBottom.heightAnchor),
            similiarHeroText.leadingAnchor.constraint(equalTo: heroSuggestionContainerBottom.leadingAnchor),
            
            containerSimiliarHero.widthAnchor.constraint(equalTo: heroSuggestionContainerBottom.widthAnchor, multiplier: 0.7),
            containerSimiliarHero.heightAnchor.constraint(equalTo: heroSuggestionContainerBottom.heightAnchor),
            containerSimiliarHero.trailingAnchor.constraint(equalTo: heroSuggestionContainerBottom.trailingAnchor),
            
            viewSimiliarHero1.topAnchor.constraint(equalTo: containerSimiliarHero.topAnchor),
            viewSimiliarHero1.bottomAnchor.constraint(equalTo: containerSimiliarHero.bottomAnchor),
            
            viewSimiliarHero2.topAnchor.constraint(equalTo: containerSimiliarHero.topAnchor),
            viewSimiliarHero2.bottomAnchor.constraint(equalTo: containerSimiliarHero.bottomAnchor),
            
            viewSimiliarHero3.topAnchor.constraint(equalTo: containerSimiliarHero.topAnchor),
            viewSimiliarHero3.bottomAnchor.constraint(equalTo: containerSimiliarHero.bottomAnchor),
            
            similiarHeroImage1.topAnchor.constraint(equalTo: viewSimiliarHero1.topAnchor),
            similiarHeroImage1.bottomAnchor.constraint(equalTo: viewSimiliarHero1.bottomAnchor),
            similiarHeroImage1.leadingAnchor.constraint(equalTo: viewSimiliarHero1.leadingAnchor),
            similiarHeroImage1.trailingAnchor.constraint(equalTo: viewSimiliarHero1.trailingAnchor),
            
            similiarHeroImage2.topAnchor.constraint(equalTo: viewSimiliarHero2.topAnchor),
            similiarHeroImage2.bottomAnchor.constraint(equalTo: viewSimiliarHero2.bottomAnchor),
            similiarHeroImage2.leadingAnchor.constraint(equalTo: viewSimiliarHero2.leadingAnchor),
            similiarHeroImage2.trailingAnchor.constraint(equalTo: viewSimiliarHero2.trailingAnchor),
            
            similiarHeroImage3.topAnchor.constraint(equalTo: viewSimiliarHero3.topAnchor),
            similiarHeroImage3.bottomAnchor.constraint(equalTo: viewSimiliarHero3.bottomAnchor),
            similiarHeroImage3.leadingAnchor.constraint(equalTo: viewSimiliarHero3.leadingAnchor),
            similiarHeroImage3.trailingAnchor.constraint(equalTo: viewSimiliarHero3.trailingAnchor),
            
        ])
    }
}
