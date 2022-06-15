//
//  TeamListTableViewModel.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation

protocol TeamListTableViewModelDelegate: AnyObject {
    func teamsLoadedSuccessfully()
}

class TeamListTableViewModel {
    
    var teams: [Team] = []
    // Dependency Inversion
    private var service: FirebaseSyncable
    private weak var delegate: TeamListTableViewModelDelegate?
    
    // Dependency Injection
    init(delegate: TeamListTableViewModelDelegate, service: FirebaseSyncable = FirebaseService()) {
        self.delegate = delegate
        self.service = service
    }
    
    
    func loadData() {
        service.loadTeams { result in
            switch result {
            case .success(let teams):
                self.teams = teams
                self.delegate?.teamsLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func delete(index: Int) {
        let team = teams[index]
        //remove from the local
        teams.remove(at: index)
        //remove from the remote
        service.delete(team: team)
    }
}
