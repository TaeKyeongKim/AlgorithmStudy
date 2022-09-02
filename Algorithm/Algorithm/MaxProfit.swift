//
//  MaxProfit.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/02.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
  //OnePass Approach
  var profit = 0
  for i in 1..<prices.count {
    if prices[i] > prices[i-1] {
      profit += prices[i] - prices[i-1]
    }
  }
  return profit
}
