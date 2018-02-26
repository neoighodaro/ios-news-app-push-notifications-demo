//
//  AlertsTableViewController.swift
//  techtimes
//
//  Created by Neo Ighodaro on 26/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import UIKit

class AlertsTableViewController: UITableViewController {
    
    var categories: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCategories()
        self.tableView.reloadData()
        
        navigationItem.title = "Configure Alerts"
    }
    
    // MARK: - Fetch categories data
    
    private func getCategories() {
        guard let categories = UserDefaults.standard.array(forKey: "categories") as? [[String: Any]] else {
            self.categories = [
                ["name": "Breaking News", "interest": "breaking_news", "subscribed": false],
                ["name": "Sports", "interest": "sports", "subscribed": false],
                ["name": "Politics", "interest": "politics", "subscribed": false],
                ["name": "Business", "interest": "business", "subscribed": false],
                ["name": "Culture", "interest": "culture", "subscribed": false],
            ]
            
            return self.saveCategories()
        }
        
        self.categories = categories
    }
    
    private func saveCategories() {
        UserDefaults.standard.set(self.categories, forKey: "categories")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Alert", for: indexPath)

        let category = categories[indexPath.row]
        
        let switchView = UISwitch(frame: .zero)
        switchView.tag = indexPath.row
        switchView.setOn(category["subscribed"] as! Bool, animated: true)
        switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        cell.textLabel?.text = category["name"] as? String

        return cell
    }
    
    // MARK: - Subscribed for category
    
    @objc func switchChanged(_ sender: UISwitch) {
        categories[sender.tag]["subscribed"] = sender.isOn
        saveCategories()
    }
}
