//
//  main.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/08/28.
//

import Foundation

let test = LeetNum9()
var array = ["a"]

//var array2 = [1]
//print(removeDuplicates(&array))
//var arr = Array(repeating: Set<Character>(), count: 9)
//rotate(&array, 2)
//print(containsDuplicates(array))
//print(intersect(array, array2))
//print(moveZeroes(&array))
//print(twoSum(array, 4))
//print(isValidSudoku(array))
//print(rotate(&array))
//print(reverseString(&array))
//print(reverse(0))
//print(firstUniqChar("aabb"))

//print(isAnagram("😘한긓", "😘한긓"))
//print(isPalindrome("Hello, world! zażółć gęślą jaźń"))
//print(myAtoi("20000000000000000000"))

//let haystack = "aaa", needle = "aaaa"
//let haystack = "leetcode", needle = "leet"
//print(strStr(haystack, needle))


//print(longestCommonPrefix(array))
let arr = [2,3,4,5]
//현재 head 는 노드의 첫 노드를 가르킨다.
var head: ListNode? = ListNode(1)
//현재 head 의 첫번째 노드를 가르키는 주소를 pointer 에 할당
var pointer: ListNode? = head


for items in arr {
  let node = ListNode(items)
  //head 의 next 주소에 새로운 노드 할당
  head?.next = node
  //head 는 그 다음 값을 가르키고 있다.
  head = head?.next
  
}
//print(head)
reverseList(pointer)
