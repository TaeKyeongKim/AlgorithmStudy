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
let arr = [2,4]
let arr2:[Int] = [2,4]
//현재 head 는 노드의 첫 노드를 가르킨다.
var head: ListNode? = ListNode(1)
var head2: ListNode? = ListNode(1)
//현재 head 의 첫번째 노드를 가르키는 주소를 pointer 에 할당
var list1: ListNode? = head
var list2: ListNode? = head2

for items in arr {
  let node = ListNode(items)
  //head 의 next 주소에 새로운 노드 할당
  head?.next = node
  //head 는 그 다음 값을 가르키고 있다.
  head = head?.next
}

for items in arr2 {
  let node = ListNode(items)
  //head 의 next 주소에 새로운 노드 할당
  head2?.next = node
  //head 는 그 다음 값을 가르키고 있다.
  head2 = head2?.next
}

//print(head)
//print(mergeTwoLists(ListNode(5), list2))

//let mergedList = mergeTwoLists(list1, list2)
//print("d")
//print(isPalindrome(list1))
//list1?.next?.next?.next = list1
//print(hasCycle(list1))

//[3,9,20,null,null,15,7]
//let treeNode = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
//print(maxDepth(treeNode))
//print(isValidBST(treeNode))
//print(isSymmetric(treeNode))

//sortedArrayToBST(nums: Array([-10,-3,0,5,9]))

//print(climbStairs(4))
//print(maxSubArray([-3,-2,-1]))
//print(shuffled([6,3,10,8,2,10,3,5,10,5,3]))

//["MinStack","push","push","push","getMin","pop","top","getMin"]
//[[],[-2],[0],[-3],[],[],[],[]]
//var minStack = MinStack()
//print(minStack.push(-2))
//print(minStack.push(0))
//print(minStack.push(-3))
//print(minStack.getMin())
//print(minStack.pop())
//print(minStack.top())
//print(minStack.getMin())

//print(fizzBuzz(15))
print(countPrimes(10))
