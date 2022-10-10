//
//  hammingDistance.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/09.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
  var cnt = 0
  var val1 = x
  var val2 = y
  while val1 != 0 || val2 != 0 {
    if val1 % 2 != val2 % 2 {
      cnt += 1
    }
    val1 = val1 / 2
    val2 = val2 / 2
  }
  return cnt
}
