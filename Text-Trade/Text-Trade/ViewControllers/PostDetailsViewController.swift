//
//  PostDetailsViewController.swift
//  Text-Trade
//
//  Created by Chris Rehagen on 4/6/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    var bookTitle: String = ""
    var authorName: String = ""
    var sellerName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = bookTitle
        authorLabel.text = "By: \(authorName)"
        sellerLabel.text = "Seller: \(sellerName)"
        
    }
    



}
