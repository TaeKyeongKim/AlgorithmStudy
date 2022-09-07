//
//  TwoSum.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/07.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  
  var dict: [Int: Int] = [:]
  
  for (index,value) in nums.enumerated() {
    guard let matchedIndex = dict[value] else {
      dict.updateValue(index, forKey: target - value)
      continue
    }
    return [index, matchedIndex]
  }
  
  return []
}
