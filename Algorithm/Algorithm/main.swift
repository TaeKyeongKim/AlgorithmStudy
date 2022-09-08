//
//  main.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/08/28.
//

import Foundation

print("Hello, World!")

let test = LeetNum9()
var array:[[Character]] = [["5","3",".",".","7",".",".",".","."],
                                 ["6",".",".","1","9","5",".",".","."],
                                 [".","9","8",".",".",".",".","6","."],
                                 ["8",".",".",".","6",".",".",".","3"],
                                 ["4",".",".","8",".","3",".",".","1"],
                                 ["7",".",".",".","2",".",".",".","6"],
                                 [".","6",".",".",".",".","2","8","."],
                                 [".",".",".","4","1","9",".",".","5"],
                                 [".",".",".",".","8",".",".","7","9"]]
var array2 = [1]
//print(removeDuplicates(&array))
//var arr = Array(repeating: Set<Character>(), count: 9)
//rotate(&array, 2)
//print(containsDuplicates(array))
//print(intersect(array, array2))
//print(moveZeroes(&array))
//print(twoSum(array, 4))
print(isValidSudoku(array))


