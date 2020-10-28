//
//  HeroesViewModelling.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 24/10/20.
//

import Foundation
import RxSwift

protocol HeroesViewModelling {
    var resultDotaHeroesList: PublishSubject<[HeroesModel]> {get}
    var resultError: PublishSubject<String> {get}
    
    func getAllHeroesList()
}
