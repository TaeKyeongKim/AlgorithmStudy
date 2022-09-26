//
//  isValidBST.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/22.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
  return validateRange(root, high: nil, low: nil)
}


func validateRange(_ root: TreeNode?, high: Int?, low: Int?) -> Bool {
  print("Inspecting : \(root?.val), low = \(low), high = \(high)")
  guard let curr = root else {return true}
  // The current node's value must be between low and high.
  if let low = low, curr.val <= low {
    print("low")
    return false
  } else if let high = high, curr.val >= high {
    print("low")
    return false
  }
  return validateRange(curr.right, high: high , low: curr.val) && validateRange(curr.left, high: curr.val, low: low)
}
