//
//  LinkedListCycle.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/20.
//

import Foundation

func hasCycle(_ head: ListNode?) -> Bool {
  var curr = head
  var inspector = head?.next

  while inspector != nil {
    if curr === inspector {
      return true
    }
    curr = curr?.next
    inspector = inspector?.next?.next
  }
  
  return false
}
