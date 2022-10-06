//
//  minStack.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/06.
//

import Foundation

class MinStack {
  
  private var stack: [(element:Int, min:Int)] = []
  
  init() {}
  
  func push(_ val: Int) {
      stack.append((val,min(val,getMin())))
  }
  
  func pop() {
    _ = stack.popLast()
  }
  
  func top() -> Int {
    return stack.last!.element
  }
  
  func getMin() -> Int {
    return stack.last?.min ?? -1
  }
}
