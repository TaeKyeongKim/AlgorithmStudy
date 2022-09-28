//
//  Binary Tree Level Order Traversal.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/28.
//

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    var queue: [TreeNode?] = []
   
    guard let curr = root else {return res}
    queue.append(curr)

    while (!queue.isEmpty) {
      var level: [Int] = []
      var count = queue.count - 1
      
        while (count >= 0) {
            if let node = queue.removeFirst() {
                level.append(node.val)
                count -= 1
                //enqueue next Nodes
                if let left = node.left {queue.append(left)}
                if let right = node.right {queue.append(right)}
            }
        }
        res.append(level)
    }
    return res
}
