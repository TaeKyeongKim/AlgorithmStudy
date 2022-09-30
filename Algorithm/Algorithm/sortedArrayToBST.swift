//
//  sortedArrayToBST.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/30.
//

import Foundation

func sortedArrayToBST(nums: [Int]) -> TreeNode? {
  
  guard !nums.isEmpty else { return nil }
  
  let mid = nums.count / 2
  
  let treeNode = TreeNode(nums[mid])
  
  treeNode.left = sortedArrayToBST(nums: Array(nums[0..<mid]))
  treeNode.right = sortedArrayToBST(nums: Array(nums[mid + 1..<nums.count]))
  
  return treeNode
}


