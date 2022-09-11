//
//  Revserse.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/11.
//

import Foundation

func reverse(_ x: Int) -> Int {
  var val = abs(x)
  let sign = x > 0 ? 1:-1
  var reversedValue = 0
  
  while val != 0 {
    let remainder = val % 10
    val = val / 10
    reversedValue = reversedValue * 10 + remainder
  }
  
  reversedValue *= sign
  if reversedValue >= Int32.max-1 || reversedValue <= Int32.min
  {return 0}
  
  return reversedValue
}
