//
//  isPowerOfThree.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/07.
//

import Foundation

func isPowerOfThree(_ n: Int) -> Bool {
  let r = (log(Double(n))/log(3.0)).rounded()
  return Int(pow(pow(Double(abs(n)), 1/3),3)) == n
}
