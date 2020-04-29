//
//  FlexibleTextField.swift
//  Text-Trade
//
//  Created by Steven Perrin on 3/11/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit

class FlexibleTextField: UITextField, UITextFieldDelegate {

    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    private var characterLimit: Int?
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      delegate = self
    }
    
    @IBInspectable var maxLength: Int {
       get {
         guard let length = characterLimit else {
           return Int.max
         }
         return length
       }
       set {
         characterLimit = newValue
       }
     }
    
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
      guard string.characters.count > 0 else {
        return true
      }
      
      let currentText = textField.text ?? ""
      let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
      
      return allowedIntoTextField(text: prospectiveText)
    }
    
    func allowedIntoTextField(text: String) -> Bool {
      return text.characters.count <= maxLength
    }

    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        self.attributedPlaceholder = placeholder
    }

}
