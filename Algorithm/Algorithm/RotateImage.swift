//
//  RotateImage.swift
//  Algorithm
//
//  Created by Kai Kim on 2022/09/09.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
  
  let N =  matrix.count
  
  for i in 0..<N/2 {
    
    for j in i..<N-1-i {
//      print(i,j)
      //Store the First element in square
      let temp = matrix[i][j]
      
      //Allocate top Element
//      print("(\(N-j-1),\(i))")
      matrix[i][j] = matrix[N-j-1][i]
      
      //Allocate Leftside Element
//      print("(\(N-i-1),\(N-j-1))")
      matrix[N-j-1][i] = matrix[N-i-1][N-j-1]
      
      //Allocate bottom element
//      print("(\(j),\(N-i-1))")
      matrix[N-i-1][N-j-1] = matrix[j][N-i-1]
      
      
      
      //Allocate rightside element
//      print("(\(N-j-1),\(i))")
      matrix[j][N-i-1] = temp
      
    }
  }
  
//  print(matrix)
}

