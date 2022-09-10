//
//  validSudoKu.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/07.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
  var itemCount = 0
  var squareSet = Array(repeating: Set<Character>(), count: (board.count/3))
  for i in 0..<board.count {
    var rowCheckSet: Set<Character> = Set<Character>()
    var colCheckSet: Set<Character> = Set<Character>()
    
    // Checking Squares, Rows, Column in sequence
    for j in 0..<board[i].count {
      let rowElement = board[i][j]
      let colElement = board[j][i]
      itemCount += 1
      let index = j/3
      
      //Checking Squares
      if checkDuplicate(val: rowElement, on: squareSet[index]) {
        squareSet[index].insert(rowElement)
      }else {
        print("detected Duplicates within the square!")
        return false
      }
      
      //Checking Rows
      if checkDuplicate(val: rowElement, on: rowCheckSet) {
        rowCheckSet.insert(rowElement)
      }else {
        print("detected Duplicates within the rows!")
        
        return false
      }
      
      //Checking Columns
      if checkDuplicate(val: colElement, on: colCheckSet) {
        colCheckSet.insert(colElement)
      }else {
        print("detected Duplicates within the columns!")
        return false
      }
    }
    //3개의 rows 씩 잘라서 진행.
    if itemCount % 27 == 0 {
      for i in 0..<squareSet.count{
        squareSet[i].removeAll()
      }
    }
    
    rowCheckSet.removeAll()
    colCheckSet.removeAll()
  }
  return true
  
}


func checkDuplicate(val: Character, on set: Set<Character>) -> Bool {
  if val == "." {return true}
  else if set.contains(val){
    return false
  }
  return true
}
