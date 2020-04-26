//
//  CommentsViewController.swift
//  Text-Trade
//
//  Created by Steven Perrin on 4/26/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit
import Firebase


class CommentsViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var saveText: UIBarButtonItem!
    @IBOutlet weak var commentTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func saveButtonWasPressed(_ sender: Any) {
        if commentTextView.text != nil && commentTextView.text != "Add A Comment...." {
            saveText.isEnabled = false
            
        }
        
    }
    
}
