//
//  climbStairs.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/02.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
  var steps: [Int] = [0,1,2]
  
  if n > 2 {
    for i in 3...n{
      steps.append(steps[i-1] + steps[i-2])
    }
  }
  
  return steps[n]
}
