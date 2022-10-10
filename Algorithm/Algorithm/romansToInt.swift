//
//  romansToInt.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/09.
//

import Foundation

enum romans: String {
  case I
  case V
  case X
  case L
  case C
  case D
  case M
  case IV
  case XL
  case CD
  case IX
  case XC
  case CM
  
  var value: Int {
    switch self {
    case .I:
      return 1
    case .V:
      return 5
    case .X:
      return 10
    case .L:
      return 50
    case .C:
      return 100
    case .D:
      return 500
    case .M:
      return 1000
    case .IV:
    return 3
    case .XL:
      return 30
    case .CD:
      return 300
    case .IX:
      return 8
    case .XC:
      return 80
    case .CM:
      return 800
    }
    return 0
  }
}


enum romans2: String {
  case I
  case V
  case X
  case L
  case C
  case D
  case M
  
  var value: Int {
    switch self {
    case .I:
      return 1
    case .V:
      return 5
    case .X:
      return 10
    case .L:
      return 50
    case .C:
      return 100
    case .D:
      return 500
    case .M:
      return 1000
    }
  }
}

func romanToInt(_ s: String) -> Int {
  var word: String = ""
  var res = 0
  
  for string in s {
  word += String(string)
    if word.count > 1 {
      let endIndex = word.index(before: word.endIndex)
      let lastWordIndex = word.index(endIndex, offsetBy: -1)
      let lastTwoWords = String(word[lastWordIndex...endIndex]) //Retrieve lastTwoWords
//      print("\(lastWord)")
      if let value = romans(rawValue: String(lastTwoWords))?.value {
//        print(value)
        res += value
        continue
      }
    }
    res += romans(rawValue: String(string))!.value
  }
  
  let arr = Array(s)

  for i in 0..<arr.count {
    let val = romans2(rawValue: String(arr[i]))!.value
    if i+1 < arr.count, val < romans2(rawValue: String(arr[i+1]))!.value {
      res -= val
    }else {
      res += val
    }
  }
  
  return res
}
