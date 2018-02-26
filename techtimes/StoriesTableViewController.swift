//
//  StoriesTableViewController.swift
//  
//
//  Created by Neo Ighodaro on 26/02/2018.
//

import UIKit

struct Stories {
    
    struct Request {
        let URL = "http://127.0.0.1:8000/stories"
    }
    
    struct Response {
        var stories: [Story]
        
        init(stories: [[String:AnyObject]]) {
            self.stories = []
        }
    }

    struct Story {
        let id: Int
        let title: String
        let content: String
        let created_at: Date
        let featuredImage: UIImage?
    }
}

class StoriesTableViewController: UITableViewController {
    
    var stories: [Stories.Story] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
}
