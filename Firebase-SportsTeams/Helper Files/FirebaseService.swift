//
//  NetworkController.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation
import Firebase

protocol FirebaseSyncable {
    func save(_ team: Team)
    func loadTeams(completion: @escaping(Result<[Team], FirebaseError>) -> Void)
    func delete(team: Team)
}

enum FirebaseError: Error {
    case fireBaseError(Error)
    case failedToUnwrapData
    case noDataFound
}

struct FirebaseService: FirebaseSyncable {
    
    let reference = Firebase.Database.database().reference()
    
    func save(_ team: Team) {
        // save the dictionary of the log to the correct child location.
        reference.child("teams").updateChildValues([team.uuid : team.teamData])
    }
   
    
    func loadTeams(completion: @escaping (Result<[Team], FirebaseError>) -> Void) {
        reference.child("teams").getData { error, snapshot in
            if let error = error {
                completion(.failure(.fireBaseError(error)))
                return
            }
            guard let data = snapshot?.value as? [String: [String: AnyObject]]
            else {
                completion(.failure(.noDataFound))
                return
            }
            let teamsArray = Array(data.values)
            let teams = teamsArray.compactMap({Team(dictionary: $0)})
            completion(.success(teams))
        }
    }
    
    func delete(team: Team) {
        reference.child(Team.TeamKeys.collectionType).child(team.uuid).removeValue()
    }
    
}
