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
//         var array = nums
//         var tree = TreeNode(array.removeFirst())
//         var rightTrace: TreeNode?
//         var arrayCnt = array.count
//         var queue: [TreeNode] = []
//
//         while (array.count - 1 > arrayCnt / 2)  {
//             var newNode = TreeNode(array.removeFirst())
//             if tree.left == nil && tree.right == nil {
//                 newNode.left = tree
//                 tree = newNode
//             }
//             else if tree.left == nil {
//                 tree.left = newNode
//             } else {
//                 tree.right = newNode
//             }
//           if array.isEmpty {return tree}
//         }
//
//        //문제점 1: 최상위 Node 를 지정해주고, Array 가 empty 일때
//        //Make Top node
//        var newNode = TreeNode(array.removeFirst())
//        newNode.left = tree
//        tree = newNode
//        var newNode1 = TreeNode(array.removeLast())
//        tree.right = newNode1
//        rightTrace = tree.right
//
//         //Make rightSubtrees
//         while !array.isEmpty {
//             var newNode = TreeNode(array.removeLast())
//              if rightTrace?.left == nil {
//                 rightTrace?.left = newNode
//                 rightTrace = rightTrace?.left
//              }else {
//                rightTrace?.
//              }
//         }
//         return tree
}
