//
//  NetworkController.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation
import Firebase

struct NetworkController {
    
    let reference = Firebase.Database.database().reference()
    
    func save(teams: [Team]) {
        let encodedLogs = teams.compactMap({[$0.uuid : $0.teamData]})
        reference.child("teams").setValue(encodedLogs)
    }
    
    func update(team: Team) {
        // save the dictionary of the log to the correct child location.
        reference.child("teams").updateChildValues([team.uuid : team.teamData])
    }
}
