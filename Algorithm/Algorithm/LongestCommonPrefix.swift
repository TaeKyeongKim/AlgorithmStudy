//
//  LongestCommonPrefix.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/13.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
  var prefix = strs.first!
  for i in 1..<strs.count {
    prefix = prefix.commonPrefix(with: strs[i])
  }
  return prefix
}
