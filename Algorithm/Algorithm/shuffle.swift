//
//  shuffle.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/06.
//

import Foundation

func shuffled(_ nums:[Int] ) -> [Int] {
  var copy = nums

  for i in stride(from: nums.count-1, through: 1, by: -1){
    let index = Int.random(in: 0...i)
    if index != i {
      copy.swapAt(i, index)
    }
  }
  return copy
}
