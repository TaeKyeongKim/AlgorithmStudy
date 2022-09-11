//
//  IsAnagram.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/11.
//

import Foundation
func isAnagram(_ s: String, _ t: String) -> Bool {
  return s.sorted(by: {$0 < $1}) == t.sorted(by: {$0 < $1})
}
