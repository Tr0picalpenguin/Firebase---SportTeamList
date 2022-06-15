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
        viewModel = TeamListTableViewModel(delegate: self)
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teams.count
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
            viewModel.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
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

extension TeamListTableViewController: TeamListTableViewModelDelegate {
    func teamsLoadedSuccessfully() {
        tableView.reloadData()
    }
}
