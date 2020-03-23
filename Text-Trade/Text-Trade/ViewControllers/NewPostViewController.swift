//
//  NewPostViewController.swift
//  Text-Trade
//
//  Created by Chris Rehagen on 3/20/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class NewPostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var postButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var classUsedForTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        setupUI()


    }
    
    func setupUI(){
        titleTextField.layer.borderWidth = 2
        titleTextField.layer.cornerRadius = 10
        titleTextField.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        titleTextField.layer.cornerRadius = 22
        titleTextField.clipsToBounds = true
        
        authorTextField.layer.borderWidth = 2
        authorTextField.layer.cornerRadius = 10
        authorTextField.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        authorTextField.layer.cornerRadius = 22
        authorTextField.clipsToBounds = true
        
        classUsedForTextField.layer.borderWidth = 2
        classUsedForTextField.layer.cornerRadius = 10
        classUsedForTextField.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        classUsedForTextField.layer.cornerRadius = 22
        classUsedForTextField.clipsToBounds = true
        
    }
    
    @IBAction func handlePostButton(_ sender: Any) {
        
        guard let userProfile = UserService.currentUserProfile else { return }
        
        let postRef = Database.database().reference().child("posts").childByAutoId()
        let postObject = [
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username,
                "photoURL": userProfile.photoURL.absoluteString
            ],
            //"text": textView.text,
            "text": titleTextField.text ?? "",
            "authorName": authorTextField.text ?? "",
            "classUF": classUsedForTextField.text ?? "",
            "timestamp": [".sv":"timestamp"]
        ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
            }
        })
        
        self.dismiss(animated: true, completion: nil)

    }
    
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        
    }

}