//
//  Atoi.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/12.
//

import Foundation

func myAtoi(_ s: String) -> Int {
  
  var removedWhiteSpace = s.trimmingCharacters(in: CharacterSet.whitespaces)

  var sign = 1
  var value = 0
  
  if removedWhiteSpace.hasPrefix("-"){
    sign = -1
    removedWhiteSpace.removeFirst()
  }
  else if removedWhiteSpace.hasPrefix("+"){
    sign = 1
    removedWhiteSpace.removeFirst()
  }
  

  for char in removedWhiteSpace {
    if char.asciiValue! >= 48 && char.asciiValue! <= 57 && value < Int32.max && value > Int32.min {
      value = value * 10 + Int(String(char))!
    }else {
      break
    }
  }
  
  var res = sign * value
  
  if res > Int32.max - 1 {
    res = Int(Int32.max)
  }
  else if res < Int32.min {
    res = Int(Int32.min)
  }
            
  return res
}
