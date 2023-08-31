//
//  PrettyNumber.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/22.
//

import Foundation


/**
 * prettyNumber
 
 * Let’s take a look at the number 45656.
 
 * This number has a difference of 1 between all adjacent digits. This number is called a “pretty number”.
 
 * Given an integer N (the number of digits), write a program to print the total number of pretty numbers. (A number cannot start with 0)
 - Parameter n: the number of digits (length) (`1 <= N <= 100`)
 - Returns: Print the number of pretty numbers.
 */
func prettyNumber(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[N][L] = the total number of pretty numbers with N digits and ends with L (Last digits)
  // d[n] = d[N-1][L-1] + d[N-1][L+1] where 1 <= L <= 8
  // d[N][L] = d[N-1][L-1] where L = 9
  // d[N][L] = d[N-1][L+1] where L = 0
  
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  // Set up N = 1
  for i in 1...9 {
    d[1][i] = 1
  }
  
  if n >= 2 {
    for i in 2...n {
      for j in 0...9 {
        if j >= 1 { d[i][j] += d[i - 1][j - 1] }
        if j <= 8 { d[i][j] += d[i - 1][j + 1] }
      }
    }
  }
  
  var result = 0
  for i in 0...9 {
    result += d[n][i]
  }
  return result
}
