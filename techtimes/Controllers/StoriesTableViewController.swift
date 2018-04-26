//
//  StoriesTableViewController.swift
//  
//
//  Created by Neo Ighodaro on 26/02/2018.
//

import UIKit
import Alamofire

class StoriesTableViewController: UITableViewController {
    
    var stories: [Stories.Story] = []

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140

        self.fetchStories { response in
            guard let response = response else { return }
            self.stories = response.stories
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        self.navigationController?.navigationBar.tintAdjustmentMode = .automatic
    }
    
    // MARK: - Fetch stories
    
    private func fetchStories(completion: @escaping(Stories.Response?) -> Void) {
        let request = Stories.Request()
        Alamofire.request(request.URL).validate().responseJSON { response in
            guard response.result.isSuccess,
            let stories = response.result.value as? [[String:AnyObject]] else {
                self.noStoriesAlert()
                return completion(nil)
            }
            
            completion(Stories.Response(stories: stories))
        }
    }
    
    private func noStoriesAlert() {
        let alertController = UIAlertController(title: "Error Fetching News",
                                               message: "An error occurred while fetching the latest news.",
                                               preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

        self.present(alertController, animated: true, completion: nil)   
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Story", for: indexPath) as! StoryTableViewCell
        let story = stories[indexPath.row]
        let randomNum = arc4random_uniform(6) + 1

        cell.imageView?.image = UIImage(named: "image-\(randomNum)")
        cell.storyTitle?.text = story.title
        cell.storyContent?.text = story.content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
        vc.story = stories[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
