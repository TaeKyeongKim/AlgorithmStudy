//
//  FirstUniqueChar.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/11.
//

import Foundation
func firstUniqChar(_ s: String) -> Int {
  
  var dict:[Character:Int] = [:]
  
  for character in s {
    if dict[character] != nil, let count = dict[character] {
      dict.updateValue(count + 1, forKey: character)
    }else {
      dict.updateValue(1, forKey: character)
    }
  }
  
  for (index,character) in s.enumerated() {
    if dict[character] == 1 {
      return index
    }
  }
  return -1
}
