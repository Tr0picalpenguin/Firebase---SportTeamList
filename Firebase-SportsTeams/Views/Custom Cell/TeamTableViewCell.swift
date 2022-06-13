//
//  TeamTableViewCell.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    
    func configureCell(with team: Team) {
        teamNameLabel.text = team.name
    }
}
