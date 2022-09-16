//
//  removeFromNthNode.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/15.
//

import Foundation
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  var indexCnt = 1
  var counter = head
  var curr = head
  var prev: ListNode?
  
  //list 의 개수가 몇개인지 확인
  while counter?.next != nil {
    counter = counter?.next
    indexCnt += 1
  }
  
  //indexCnt 와 n 값이 같다면 제일 첫번째 요소를 지운다는 뜻.
  if indexCnt == n {
    curr = curr?.next
    return curr
  }
  
  //prev, curr 포인터 이동
  for _ in 0..<indexCnt-n {
    prev = curr
    curr = curr?.next
    // print(curr?.val)
  }
  
  //prev 를 curr 다음 노드에 연결 한뒤 curr.next 를 끊어준다.
  prev?.next = curr?.next
  curr?.next = nil
  
  return head
}
