//
//  pascal'sTriangle.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/10/09.
//

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
  
  var res: [[Int]] = []
  
  for row in 0..<numRows {
    var rows: [Int] = []
    
    for i in 0...row {
      if i == 0 || i == row {
        rows.append(1)
      }else {
        rows.append(res[row-1][i-1] + res[row-1][i])
      }

    }
    res.append(rows)
  }
  return res
}
