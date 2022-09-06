//
//  intersect.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/05.
//

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  
  var res: [Int] = []
  var outter = nums1.count >= nums2.count ? nums2 : nums1
  var inner = nums1.count >= nums2.count ? nums1 : nums2
  var m = outter.count
  while m > 0 {
    let lastElement = outter.last!
    if let matchedIndex = inner.firstIndex(where: {$0 == lastElement}) {
      res.append(lastElement)
      inner.remove(at: matchedIndex)
    }
    outter.removeLast()
    m -= 1
  }
  
  
//  var dict1: [Int:Int] = [:]
//  var dict2: [Int:Int] = [:]
//
//  for (index, value) in nums1.enumerated() {
//    dict1.updateValue(value, forKey: index)
//  }
//
//  for (index, value) in nums2.enumerated() {
//    dict2.updateValue(value, forKey: index)
//  }
//
//  for (key,value) in dict1 {
//    let interestedElement = dict2.filter({$0.value == value})
//
//  }
  return res
}
