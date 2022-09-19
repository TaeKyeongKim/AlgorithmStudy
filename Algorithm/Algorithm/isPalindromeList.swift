//
//  isPalindromeList.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/19.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {

  let midNode = getLastHalfList(head: head)
  var reversedMidNode = reverseList(midNode)
  var curr = head
  
  while reversedMidNode != nil {
    if curr?.val != reversedMidNode?.val {
      return false
    }
    reversedMidNode = reversedMidNode?.next
    curr = curr?.next
  }

  return true
}

//pass firsthalf of list
func getLastHalfList(head: ListNode?) -> ListNode? {
  
  var curr = head
  var nextNode = head
  
  while nextNode?.next != nil && nextNode?.next?.next != nil {
    nextNode = nextNode?.next?.next
    curr = curr?.next
  }
  
  return curr?.next
}

