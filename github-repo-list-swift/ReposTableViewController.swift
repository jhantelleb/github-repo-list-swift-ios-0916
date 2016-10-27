//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"

        store.getRepositoriesFromAPI{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = store.repositories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        cell.textLabel?.text = ("Repository Name: \(repo.fullName)")
        cell.detailTextLabel?.text = ("html URL: \(String(describing: repo.htmlURL)) Repository ID: \(repo.repositoryID)")
    
        return cell
    }
}
