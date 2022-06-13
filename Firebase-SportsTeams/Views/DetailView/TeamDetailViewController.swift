//
//  TeamDetailViewController.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var sportTypeTextField: UITextField!
    
    var viewModel: TeamDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text?.capitalized,
              let location = locationTextField.text?.capitalized,
              let sport = sportTypeTextField.text?.capitalized else { return }
        
        viewModel.saveTeam(sport: sport, name: name, location: location)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateUI() {
        guard let team = viewModel.team else { return }
        nameTextField.text = team.name
        locationTextField.text = team.location
        sportTypeTextField.text = team.sport
    }

}
