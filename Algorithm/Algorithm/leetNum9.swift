//
//  leetNum9.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/08/28.
//

import Foundation

class LeetNum9 {
  func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {return false}
    return x == reverse(x:x)
  }
  
  private func reverse(x: Int) -> Int {
    var temp = x
    var digit: [Int] = []
    while temp > 0 {
      let remainder = temp % 10
      temp = temp / 10
      digit.append(remainder)
    }
    return digit.reduce(0,{$0*10 + $1})
  }
  
}
