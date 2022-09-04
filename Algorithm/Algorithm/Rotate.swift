//
//  Rotate.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/02.
//

import Foundation

//If we will shift elements one by one it will become hard
//to keep tack of all elements without using additional space.

//so we will divide the array into sets/ctcles
//where the number of sets will depend on the value of n and k.


func gcd(_ a: Int, _ b: Int) -> Int {
  if b == 0 {return a}
  else{
    return gcd(b, a%b)
  }
}

func rotate(_ nums: inout [Int], _ k: Int) {
  //MARK: 방법1. temp Array 사용
  var offSet = k % nums.count
  //  print(offSet)
  //  var temp: [Int] = Array(repeating: 0, count: nums.count)
  //
  //  var index = 0
  //
  //  for i in (nums.count - offSet)..<nums.count { //for loop to interate right hand side of the original array
  //    temp[index] = nums[i]
  //    index += 1
  //  }
  //
  //  //print(temp)
  //  for j in 0..<nums.count - offSet {
  //    temp[index] = nums[j]
  //    index += 1
  //  }
  //
  //  //print(temp)
  //  for i in 0..<nums.count {
  //    nums[i] = temp[i]
  //  }
  
  //MARK: 방법2 Rotate one by one
  //  var temp = 0
  //
  //  nums = nums.reversed()
  //  while offSet > 0 {
  //    temp = nums.first!
  //    for i in 0..<nums.count - 1 {
  //      nums[i] = nums[i+1]
  //    }
  //    nums[nums.count-1] = temp
  //
  //    offSet -= 1
  //  }
  //  nums = nums.reversed()
  
  //MARK: 방법3 Juggling Algorithm
  var temp: Int
  for i in 0..<gcd(nums.count, offSet) {
    temp = nums[i]
    var j = i
    
    while true {
      let d = (j + (nums.count - offSet)) % nums.count
      if d == i {break}
      nums[j] = nums[d]
      j = d
    }
    nums[j] = temp
  }
  //ex arr = [1,2,3,4,5,6], d = 3, n = 6
  //gcd(6,3) -> 3
  //  for (int i = 0; i < g_c_d; i++) {// Outer Loop iterates for 3 times
  //
  //          /* move i-th values of blocks */
  //          int temp = arr[i]; // @i = 0, temp = 1
  //          int j = i; // j = 0
  //
  //          while (1) {
  //              int k = j + d; //k = 0 + 3 = 3
  //              if (k >= n) // if 3 >= 6 ? -> false => It checks if index "k" exceeds the length of array
  //                  k = k - n; //Since it is a left rotation, k - n
  //
  //              if (k == i) // if index "k" is equal to where it started, "i", break the loop
  //                  break;
  //              // K acts like pointer
  //              arr[j] = arr[k]; //Otherwise put array[k] element into arr[j] where j gets updated by the previous k
  //              j = k;
  //          }
  //          arr[j] = temp; //Replace the last index "j" of arry by temp variable.
  //      }
  //  //So Why do we have to use GCD?
  //  //Well essentially the juggling algorithm takes place
}
