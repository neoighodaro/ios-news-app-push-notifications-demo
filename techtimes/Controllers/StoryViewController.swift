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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UITextView!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        storyTitle.text = story?.title
        storyContent.text = story?.content
    }
}
