//
//  TeamListTableViewController.swift
//  Firebase-SportsTeams
//
//  Created by Scott Cox on 6/13/22.
//

import UIKit

class TeamListTableViewController: UITableViewController {

    var viewModel: TeamListTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        
        let team = viewModel.teams[indexPath.row]
        cell.configureCell(with: team)

        return cell
    }
   

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

   

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard let destination = segue.destination as? TeamDetailViewController else { return }
        if segue.identifier == "toDetailVC" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let team = viewModel.teams[index.row]
            destination.viewModel = TeamDetailViewModel(team: team)
        } else {
            destination.viewModel = TeamDetailViewModel()
        }
    }
}
