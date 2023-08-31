//
//  SumOfSquareNumbers.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/23.
//

import Foundation

func SumOfSquareNumbers(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = min(d[n], d[n-(j*j)] + 1) where 1 <= j * j <= n
  
  var d = [Int](repeating: Int.max, count: n + 1)
  d[0] = 0
  for i in 1...n {
    var j = 1
    while j * j <= i {
      d[i] = min(d[i], d[i - j * j] + 1)
      j += 1
    }
  }
  
  return d[n]
}
