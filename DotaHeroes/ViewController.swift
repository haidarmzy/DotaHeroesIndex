//
//  ViewController.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 22/10/20.
//

import UIKit
import RxSwift
import RxAlamofire
import Alamofire

class ViewController: UIViewController {
    fileprivate let bag:DisposeBag = DisposeBag()
    let session = URLSession.shared
    var heroesVM: HeroesViewModelling?
    
    var listHeroesData: [HeroesModel]?
    let userDefault = UserDefaults.standard
    
    let textInit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        return label
    }()
    
    let sideViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heroesListContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var categoryList: HeroesCategoryVC = {
        let list = HeroesCategoryVC()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.isUserInteractionEnabled = true
        list.categoryDelegate = self
        return list
    }()
    
    lazy var heroesList: HeroesListVC = {
        let list = HeroesListVC()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.isUserInteractionEnabled = true
        list.heroesDelegate = self
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "All"
        view.backgroundColor = UIColor.white
        view.addSubview(sideViewContainer)
        view.addSubview(heroesListContainerView)
        sideViewContainer.addSubview(categoryList)
        heroesListContainerView.addSubview(heroesList)
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let fetchArray = UserDefaults.standard.data(forKey: "dataHeroes"){
            do{
                let decodeData = try JSONDecoder().decode(Array<HeroesModel>.self, from: fetchArray)
                listHeroesData = decodeData
                heroesList.heroesData = decodeData
                heroesList.reloadData()
            } catch {
                print("ERROR DECODE userdefault \(error)")
            }
        } else {
            heroesVM = HeroesViewModel()
            heroesVM?.getAllHeroesList()
            setupRx()
        }
    }
    
    func setupRx(){
        heroesVM?.resultDotaHeroesList
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] (heroData) in
                self?.listHeroesData = heroData
                self?.heroesList.heroesData = heroData
                self?.heroesList.reloadData()
            }).disposed(by: bag)
        
        heroesVM?.resultError
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] (res) in
                if res == "ERROR" {
                    let alert = UIAlertController(title: "Connection Problem", message: "Cannot fetch data from server. Please check your connection", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self?.present(alert, animated: true)
                }
            }).disposed(by: bag)
    }
    
    private func goToDetail(heroes: HeroesModel){
        let vc = HeroDetail()
        vc.heroDetailData = heroes
        let filteredHeroes = listHeroesData?.filter({$0.primary_attr == heroes.primary_attr})
        if heroes.primary_attr == "agi" {
            let sortedHeroes = filteredHeroes?.sorted(by: { $0.move_speed! > $1.move_speed! })
            vc.highestStatData = sortedHeroes
        } else if heroes.primary_attr == "str" {
            let sortedHeroes = filteredHeroes?.sorted(by: { $0.base_attack_max! > $1.base_attack_max! })
            vc.highestStatData = sortedHeroes
        } else if heroes.primary_attr == "int" {
            let sortedHeroes = filteredHeroes?.sorted(by: { $0.base_mana! > $1.base_mana! })
            vc.highestStatData = sortedHeroes
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func filterHeroesByRole(role: String){
        self.navigationItem.title = role
        if role == "All" {
            heroesList.heroesData = listHeroesData
            heroesList.reloadData()
        } else {
            let filteredRoleHeroes = listHeroesData?.filter({$0.roles.contains(role)})
            heroesList.heroesData = filteredRoleHeroes
            heroesList.reloadData()
        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            sideViewContainer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
            sideViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            sideViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sideViewContainer.trailingAnchor.constraint(equalTo: heroesListContainerView.leadingAnchor),
            
            heroesListContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            heroesListContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            heroesListContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heroesListContainerView.leadingAnchor.constraint(equalTo: sideViewContainer.trailingAnchor),
            heroesListContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            heroesList.widthAnchor.constraint(equalTo: heroesListContainerView.widthAnchor),
            heroesList.heightAnchor.constraint(equalTo: heroesListContainerView.heightAnchor),
            
            categoryList.widthAnchor.constraint(equalTo: sideViewContainer.widthAnchor),
            categoryList.heightAnchor.constraint(equalTo: sideViewContainer.heightAnchor)
        ])
    }
}

extension ViewController: HeroesListDelegate{
    func heroesSelected(_ heroes: HeroesModel) {
        goToDetail(heroes: heroes)
    }
}

extension ViewController: HeroesCategoryDelegate{
    func categorySelected(_ category:String) {
        filterHeroesByRole(role: category)
    }
}

