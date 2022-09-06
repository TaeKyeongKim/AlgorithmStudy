//
//  intersect.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/05.
//

import Foundation

func binarySearch(_ arr: [Int], _ value: Int, _ low: Int, _ high: Int) -> Int {
  
  if low > high {return -1}
  
  let mid = (low + high) / 2
  if arr[mid] == value {
    return mid
  }
  else if arr[mid] > value {
    return binarySearch(arr, value, low, mid - 1)
  }
  else if arr[mid] < value {
    return binarySearch(arr, value, mid + 1, high)
  }
  return -1
}

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  
  var res: [Int] = []
  
  //MARK: Brute Force
//  var outter = nums1.count >= nums2.count ? nums2: nums1
//  var inner = nums1.count >= nums2.count ? nums1: nums2
//  var m = outter.count
//  while m > 0 {
//    let lastElement = outter.last!
//    if let matchedIndex = inner.firstIndex(where: {$0 == lastElement}) {
//      res.append(lastElement)
//      inner.remove(at: matchedIndex)
//    }
//    outter.removeLast()
//    m -= 1
//  }
  
  //MARK: Sort and Binary Search
  //firstIndex 는 O(N) 의 time Complexity 를 가지고 있기 때문에 Sort 와 Binary Search 를 사용해 문제 접근
  var outter = nums1.count >= nums2.count ? nums2: nums1
  var inner = nums1.count >= nums2.count ? nums1: nums2
  var m = outter.count
  while m > 0 {
    let lastElement = outter.last!
    inner = inner.sorted(by: <)
    let matchedIndex = binarySearch(inner, lastElement, 0, inner.count - 1)
    if matchedIndex >= 0 {
      res.append(lastElement)
      inner.remove(at: matchedIndex)
    }
    outter.removeLast()
    m -= 1
  }
  //MARK: Using Hash

  
  
  return res
}
