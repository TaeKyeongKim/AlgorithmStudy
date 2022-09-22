//
//  maxDepth.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/22.
//

import Foundation

// * Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

func maxDepth(_ root: TreeNode?) -> Int {
  // guard var root = root else {return 0}
  let curr = root
  let leftNode = root?.left
  let rightNode = root?.right
  var cnt = curr == nil ? 0 : 1
  
  //Base case
  if leftNode == nil && rightNode == nil {
    return cnt
  } else {
    cnt += max(maxDepth(leftNode), maxDepth(rightNode))
    return cnt
  }
}

