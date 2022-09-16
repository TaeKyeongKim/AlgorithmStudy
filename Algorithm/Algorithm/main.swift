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
let arr = [1,2,3,4,5]
var head = ListNode(arr[0])
for items in arr{
  let node = ListNode(items)
  head.next = node
  head = head.next!
}
removeNthFromEnd(head, 2)
