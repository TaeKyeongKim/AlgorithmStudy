//
//  countPrime.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/06.
//

import Foundation

func countPrimes(_ n: Int) -> Int {
  var cnt = 0
  var divisor = 2
  var primes = Array(repeating: true, count: n)
  while divisor * divisor < n {
    if primes[divisor] == true {
      var i = divisor
//      print(divisor)
      while i * divisor < n {
        primes[i*divisor] = false
//        print(i*divisor)
        i += 1
      }
    }
    divisor += 1
  }
  
  for i in 2..<n {
    cnt += primes[i] == true ? 1 : 0
  }
  
  return cnt
}
