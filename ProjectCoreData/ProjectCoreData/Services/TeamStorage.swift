//
//  TeamStorage.swift
//  ProjectCoreData
//
//  Created by Ahmed Elesawy on 25/07/2022.
//

import Foundation


class TeamStorage {
    // MARK: - Properties
    let coreDataStorage: CoreDataStorage
  
    // MARK: - Initializers
    public init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }
    
    func addTeam() {
        let team = TeamEntity(context: coreDataStorage.viewContext)
        team.name = "FBC"
        team.city = "Cairo"
        
        let player = PlayerEntity(context: coreDataStorage.viewContext)
        player.age = "29"
        player.name = "Ahmed Naguib"
        player.salary = 60000
        team.addToPlayers(player)
        coreDataStorage.saveContext()
    }
    
    
//    func fetch() {
//        let team = coreDataStorage.fetch(type: TeamEntity.self) as! [TeamEntity]
//        team.first?.playe
//        print(team)
//    }
}
