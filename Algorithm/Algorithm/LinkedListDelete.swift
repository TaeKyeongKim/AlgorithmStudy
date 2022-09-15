//
//  LinkedListDelete.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/15.
//

import Foundation


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


class Solution {
    func deleteNode(_ node: ListNode?) {
      node?.val = (node?.next!.val)!
      node?.next = node?.next?.next
    }
}

