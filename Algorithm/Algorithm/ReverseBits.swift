//
//  File.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/09.
//

import Foundation

func reverseBits(_ n: Int) -> Int {
  
  var n = n
  var result = 0
  //주어진 값 마지막부터 1 인지 0인지 확인하고, 1이면 result 에 1bit 를 마지막 자리수에 추가 해줌.
  //이 과정을 n 이 0 이 될때까지 진행.
  for i in 0..<32 {
    result += (n & 1) // (n 의 마지막 자리가 0 인지 1 인지 알기 위해서 & operator 를 사용)
    n >>= 1 // n 을 / 2 해줌
    if i < 31 { //31번 해주는데.... unsigned 라 그런듯.
      result <<= 1 //result 값 * 2, 오른쪽 shift 해줌.
    }
  }
  return result
}
