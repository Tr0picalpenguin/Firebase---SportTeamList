//
//  TeamDetailViewModel.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation

class TeamDetailViewModel {
    
    var team: Team?
    private let service: FirebaseSyncable
    
    init(team: Team? = nil, firebaseService: FirebaseSyncable = FirebaseService()) {
        self.team = team
        self.service = firebaseService
    }
   
    
    func saveTeam(sport: String, name: String, location: String) {
        if team != nil {
            updateTeam(sport: sport, name: name, location: location)
        } else {
            let team = Team(sport: sport, name: name, location: location)
            service.save(team)
        }
    }
    
    func updateTeam(sport: String, name: String, location: String) {
        
        guard let team = team else { return }
            team.sport = sport
            team.name = name
            team.location = location
    }
    
}
