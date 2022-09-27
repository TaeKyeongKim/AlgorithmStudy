//
//  Symmetric Tree.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/27.
//

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
  return validateValue(left: root?.left, right: root?.right)
}

func validateValue(left: TreeNode?, right: TreeNode?) -> Bool {
  print("A = \(left?.val), B = \(right?.val)")
  
  //Basecase1 : 시작 포인트에서 두노드의 값이 nil 이라면 true 반환 (비교할것이 없기때문에 symmetic 함)
  if (left?.val == nil && right?.val == nil) {return true}
  //Basecase2 : 시작 포인트에서 두노드의 값이 같지 않다면 false 반환
  if (left?.val != right?.val) {return false}
  //Basecase3 : 두 노드의 subtnode 값이 같지 않다면 false 반환
  print("A.left = \(left?.left?.val), B.right = \(right?.right?.val)")
  print("A.right = \(left?.right?.val), B.left = \(right?.left?.val)")
  if (left?.left?.val != right?.right?.val) && (left?.right?.val) != (right?.left?.val) {
    return false
  }
  
  //Recursive
  return validateValue(left: left?.left, right: right?.right) && validateValue(left: left?.right, right: right?.left)
}
