//
//  singleNumber.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/05.
//

import Foundation

func singleNumber(_ nums:[Int]) -> Int{
  //MARK: Using Dictionary
//  var counter: [Int: Int] = [:]
//  for num in nums {
//    if let count = counter[num] {
//      counter.updateValue(count + 1, forKey: num)
//    }else {
//      counter.updateValue(1, forKey: num)
//    }
//  }
//  if let res = counter.first(where: {$0.value == 1}) {
//    return res.key
//  }
//  return 0
  
  //MARK: Using Set
  var set = Set<Int>()
  for num in nums {
    if set.contains(num) {
      set.remove(num)
    }else {
      set.insert(num)
    }
  }
  return set.first!
  
}

