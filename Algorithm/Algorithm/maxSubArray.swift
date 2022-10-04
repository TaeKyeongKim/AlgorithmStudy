//
//  maxSubArray.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/04.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
  
  var cnt = 0
  var startPointer = 0
  var maxSum = nums[cnt]
  var curr = nums[cnt]
  
  while cnt < nums.count-1 {
    //만약 다음값이 더크다면, sp 업데이트
    if curr < (nums[cnt+1]) {
      startPointer = cnt+1
      curr = curr + nums[startPointer] < nums[startPointer] ? nums[startPointer] : curr + nums[startPointer]
    } else {
      curr += nums[cnt+1]
    }
    
    if curr > maxSum {
      maxSum = curr
    }
    cnt += 1
  }
  
  return maxSum
}
