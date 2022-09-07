//
//  plusOne.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/06.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
  var res: [Int] = []
  var carry = 1
  var index = digits.count - 1
  while index > -1 {
    let sum = digits[index] + carry
    if index == 0 && sum > 9 {
      res += [0,1]
    }else if sum > 9 {
      carry = 1
      res.append(0)
    }else {
      carry = 0
      res.append(sum)
    }
    index -= 1
  }
  return res.reversed()
}
