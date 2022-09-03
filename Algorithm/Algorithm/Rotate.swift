//
//  Rotate.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/02.
//

import Foundation

//If we will shift elements one by one it will become hard
//to keep tack of all elements without using additional space.

//so we will divide the array into sets/ctcles
//where the number of sets will depend on the value of n and k.


func rotate(_ nums: inout [Int], _ k: Int) {
//MARK: 방법1. temp Array 사용
  var offSet = k % nums.count
//  print(offSet)
//  var temp: [Int] = Array(repeating: 0, count: nums.count)
//
//  var index = 0
//
//  for i in (nums.count - offSet)..<nums.count { //for loop to interate right hand side of the original array
//    temp[index] = nums[i]
//    index += 1
//  }
//
//  //print(temp)
//  for j in 0..<nums.count - offSet {
//    temp[index] = nums[j]
//    index += 1
//  }
//
//  //print(temp)
//  for i in 0..<nums.count {
//    nums[i] = temp[i]
//  }
  
  //MARK: 방법2 Rotate one by one
  var temp = 0
  nums = nums.reversed()
  while offSet > 0 {
    temp = nums.first!
    for i in 1..<nums.count {
      nums[i-1] = nums[i]
    }
    nums[nums.count-1] = temp
    
    offSet -= 1
  }
  nums = nums.reversed()
}
