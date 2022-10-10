//
//  hammingWeight.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/09.
//

import Foundation

func hammingWeight(_ n: Int) -> Int {
    var cnt = 0
    var val = n
  
    while val > 0 {
      if val % 2 == 1 {
        cnt += 1
      }
      val = val / 2
    }
//  var count = 0
//  var n = n
//
//  while n > 0 {
////    print(n - 1)
//    UInt32(n)
//    print(UInt32(n).description)
//    n &= n - 1
//    count += 1
//   }
//
//  return count
  
    return cnt
}
