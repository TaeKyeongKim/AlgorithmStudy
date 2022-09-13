//
//  strStr.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/13.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {

  if haystack.count < needle.count {return -1}
  
  for i in 0...haystack.count - needle.count {
    let newStartIndex = haystack.index(haystack.startIndex, offsetBy: i)
    let newEndIndex = haystack.index(haystack.startIndex, offsetBy: needle.count - 1 + i)
    if haystack[newStartIndex...newEndIndex] == needle {
      return i
    }
  }

  return -1
}
