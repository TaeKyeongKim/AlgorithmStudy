//
//  fizzbuzz.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/06.
//

import Foundation

enum FizzBuzz {
  case compute (Int)
  
  var string:String {
    switch self {
    case .compute(let num):
      if num % 3 == 0 && num % 5 == 0 {
        return "FizzBuzz"
      }else if num % 5 == 0 {
        return "Buzz"
      }else if num % 3 == 0 {
        return "Fizz"
      }else{
        return "\(num)"
      }
    }
  }
}

func fizzBuzz(_ n: Int) -> [String] {
  
  var res: [String] = []
  for i in 1...n {
    let fizzbuzz: FizzBuzz = .compute(i)
    res.append(fizzbuzz.string)
  }
  return res
}
