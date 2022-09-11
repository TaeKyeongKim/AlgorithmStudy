//
//  IsPalindrome.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/11.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
  let result = String(s.unicodeScalars.filter({CharacterSet.alphanumerics.contains($0)})).map({$0.lowercased()})
  let reversed = result.reversed()
  return result.joined() == reversed.joined()
}
