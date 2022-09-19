//
//  MergeList.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/18.
//

import Foundation

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
 
  //리스트 둘중에 하나가 비어 있을경우
  guard let list1 = list1 else {
    return list2
  }
  guard let list2 = list2 else {
    return list1
  }

  //리스트의 next 값이 nil 이 될때까지 진행
  //list 값을 비교
  if list1.val < list2.val {
    //list1 의 다음 노드를
    list1.next = mergeTwoLists(list1.next, list2)
    return list1
  } else {
    list2.next = mergeTwoLists(list1, list2.next)
    return list2
  }
  
 }
