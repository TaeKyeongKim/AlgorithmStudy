//
//  reverseListNode.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/18.
//

import Foundation
func reverseList(_ head: ListNode?) -> ListNode? {
  //temp 는 현재 Nill 의 주소 값을 가지고 있음.
  var revseredList: ListNode? = nil
  //curr 은 head 의 첫번쨰 노드를 가르키고 있음.
  var curr = head
  //temp 는 head 의 다음 노드를 가르킴.
  var temp2 = curr?.next
  
  while curr != nil {
    //curr 의 다음 요소의 주소 값을 temp 로 지정
//    print(curr?.val)
    curr?.next = revseredList
    revseredList = curr
    curr = temp2
    temp2 = curr?.next
  }
  
  return revseredList
}
