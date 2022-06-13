//
//  Team.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation


class Team: Codable {
    
    // MARK: - Properties
    var sport: String
    var name: String
    var location: String
    let uuid: String
    
    // Dictionary representation
    var teamData: [String: AnyHashable] {
        ["sport": self.sport,
          "name": self.name,
      "location": self.location,
          "uuid": self.uuid]
    }
    
    // MARK: - Initializers
    init(sport: String, name: String, location: String, uuid: String = UUID().uuidString) {
        self.sport = sport
        self.name = name
        self.location = location
        self.uuid = uuid
    }
}

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
