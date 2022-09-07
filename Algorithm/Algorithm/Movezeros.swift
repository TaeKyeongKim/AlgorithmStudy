//
//  Movezeros.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/07.
//

import Foundation
func moveZeroes(_ nums: inout [Int]) {
  var pointerToZero = 0
  for i in 0..<nums.count {
    if nums[i] == 0 {continue}
    nums.swapAt(i, pointerToZero)
    pointerToZero += 1
  }
}
