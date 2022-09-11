//
//  ReverseString.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/11.
//

import Foundation

func reverseString(_ s: inout [Character]) {
    
  var index = s.count - 1
  var pointer = 0
  while index >= pointer {
    s.swapAt(index, pointer)
    index -= 1
    pointer += 1
  }
  
  print(s)
}
