//
//  MergeSort.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/01.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
 
  var updatingPointer = m-m-1
  var nums1Pointer = m-1
  var nums2Pointer = n-1
  
  while updatingPointer >= 0, nums2Pointer >= 0 {
    if nums1Pointer >= 0, nums1[nums1Pointer] > nums2[nums2Pointer] {
      nums1[updatingPointer] = nums1[nums1Pointer]
      nums1Pointer -= 1
    }else {
      nums1[updatingPointer] = nums2[nums2Pointer]
      nums2Pointer -= 1
    }
    updatingPointer -= 1
  }
  
  
//  var pointer1 = 0
//  var pointer2 = 0
//  var pointer1Range = m
//
//  while (pointer1 < pointer1Range) && (pointer2 < n)  {
//    if nums1[pointer1] > nums2[pointer2] {
//      nums1.insert(nums2[pointer2], at: pointer1)
//      pointer2 += 1
//      pointer1Range += 1
//    } else {
//      pointer1 += 1
//    }
//  }
//
//  if pointer2 != n {
//    nums1.replaceSubrange(pointer1..<nums1.count, with: Array(nums2[pointer2..<nums2.count]))
//  }
//
//  nums1 = Array(nums1[0..<m+n])
}
