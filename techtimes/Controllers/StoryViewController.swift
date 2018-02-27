//
//  StoryViewController.swift
//  techtimes
//
//  Created by Neo Ighodaro on 26/02/2018.
//  Copyright © 2018 CreativityKills Co. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    var story: Stories.Story?

    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        storyTitle.text = story?.title
        storyContent.text = story?.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
