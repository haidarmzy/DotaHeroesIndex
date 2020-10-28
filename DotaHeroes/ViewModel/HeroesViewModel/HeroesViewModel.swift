//
//  HeroesViewModel.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 24/10/20.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

class HeroesViewModel: HeroesViewModelling {
    fileprivate let bag:DisposeBag = DisposeBag()
    let session : URLSession = URLSession.shared
    
    let userDefault = UserDefaults.standard
    
    let resultDotaHeroesList: PublishSubject<[HeroesModel]> = PublishSubject()
    let resultError: PublishSubject<String> = PublishSubject()
    
    func getAllHeroesList(){
        do{
            RxAlamofire.data(.get, "https://api.opendota.com/api/herostats")
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] (data) in
                    do {
                        let heroesData = try JSONDecoder().decode(Array<HeroesModel>.self, from: data)
                        self?.resultDotaHeroesList.onNext(heroesData)
                        self?.userDefault.set(data, forKey: "dataHeroes")
                    }
                    catch {
                        print("ERROR DECODE RESULT \(error)")
                    }
                }, onError: { [weak self] (error) in
                    self?.resultError.onNext("ERROR")
                }, onCompleted: { [weak self] in
                    print("COMPLETE CALL API")
                }).disposed(by: bag)
        }
        catch{
            print("Failed to create Request \(error)")
        }
    }
}
