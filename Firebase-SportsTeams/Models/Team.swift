//
//  Team.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import Foundation
import UIKit


class Team: Codable {
    
    enum TeamKeys {
        static let sport = "sport"
        static let name = "name"
        static let location = "location"
        static let uuid = "uuid"
        static let collectionType = "teams"
        static let sportImage = "sportImage"
        
    }
    // MARK: - Properties
    var sport: String
    var name: String
    var location: String
    let uuid: String
//    var sportImage: String
  
    
    // Dictionary representation
    var teamData: [String: AnyHashable] {
        ["sport": self.sport,
         "name": self.name,
         "location": self.location,
         "uuid": self.uuid]
 //        "sportImage": self.sportImage]
    }
    
    // MARK: - Initializers
    init(sport: String, name: String, location: String, uuid: String = UUID().uuidString) {
        self.sport = sport
        self.name = name
        self.location = location
        self.uuid = uuid
 //       self.sportImage = sportImage
    }
} // end of class

extension Team {
    
    convenience init?(dictionary: [String: Any]) {
        guard let sport = dictionary[TeamKeys.sport] as? String,
              let name = dictionary[TeamKeys.name] as? String,
              let location = dictionary[TeamKeys.location] as? String,
              let uuid = dictionary[TeamKeys.uuid] as? String else {
                  return nil
              }
        self.init(sport: sport, name: name, location: location, uuid: uuid)
    }
}
                                    

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
