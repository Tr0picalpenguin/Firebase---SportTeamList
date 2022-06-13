//
//  TeamDetailViewModel.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation

class TeamDetailViewModel {
    
    var team: Team?
    
    init(team: Team? = nil) {
        self.team = team
    }
   
    
    func saveTeam(sport: String, name: String, location: String) {
        if team != nil {
            updateTeam(sport: sport, name: name, location: location)
        } else {
            team = Team(sport: sport, name: name, location: location)
            NetworkController().update(team: team!)
        }
    }
    
    func updateTeam(sport: String, name: String, location: String) {
        
        if let team = team {
            team.sport = sport
            team.name = name
            team.location = location
        } else {
            team = Team(sport: sport, name: name, location: location)
        }
        NetworkController().update(team: team!)
    }
    
}
