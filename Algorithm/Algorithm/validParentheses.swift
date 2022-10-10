//
//  validParentheses.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/10.
//

import Foundation

func isValidParentheses(_ s: String) -> Bool {
  let brackets: [String:String] = [")":"(","]":"[","}":"{" ] //closed: open
  var stack: [String] = []
  
  for char in s {
    if let matchedBracket = brackets[String(char)], let lastString = stack.popLast() {
      if lastString != matchedBracket {
        return false
      }
      continue
    }
    stack.append(String(char))
  }
  return stack.isEmpty
}
