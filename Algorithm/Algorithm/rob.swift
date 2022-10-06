//
//  rob.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/05.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
  var rob1 = 0
  var rob2 = 0  
  for num in nums {
    var temp = max(num + rob1,rob2)
    rob2 = rob1
    rob1 = temp
  }
  return rob2
}
