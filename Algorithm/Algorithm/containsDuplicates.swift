//
//  containsDuplicates.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/05.
//

import Foundation

func containsDuplicates(_ nums:[Int]) -> Bool {
//MARK: Using dictionary
//  var dict: [Int: Int] = [:]
//  for (index, value) in nums.enumerated() {
//    if dict[value] != nil {
//      return true
//    }else {
//      dict.updateValue(index, forKey: value)
//    }
//  }
//  return false
  
  //MARK: Using Set
  var set = Set<Int>()
  for num in nums {
    if set.contains(num) {return true}
    set.insert(num)
  }
  return false
}
