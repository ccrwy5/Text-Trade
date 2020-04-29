//
//  AllowedCharsTextField.swift
//  Text-Trade
//
//  Created by Steven Perrin on 4/29/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import Foundation
import UIKit

class AllowedCharsTextField: FlexibleTextField {
  
  @IBInspectable var allowedChars: String = ""
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    delegate = self
    autocorrectionType = .no
  }
  

  override func allowedIntoTextField(text: String) -> Bool {
    return super.allowedIntoTextField(text: text) &&
           text.containsOnlyCharactersIn(matchCharacters: allowedChars)
  }
  
}
 
private extension String {
  
  
  func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
    let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
    return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
  }
 
}
