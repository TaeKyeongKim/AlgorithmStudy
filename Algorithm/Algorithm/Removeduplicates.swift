//
//  Removeduplicates.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/01.
//

import Foundation
//LeetCode https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/

func removeDuplicates (_ nums: inout [Int]) -> Int {
  var pointer = 1
  for i in 1..<nums.count {
    if nums[i] != nums[i-1]{
      nums[pointer] =  nums[i]
      print("\(i):\(nums)")
      print("Pointer=\(pointer)")
      pointer += 1
    }
  }
  print(nums)
  return pointer
}
