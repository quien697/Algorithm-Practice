//
//  MakeOne.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/21.
//

import Foundation

/**
 * There are 3 operations that can be used for integer X:
   1. If X is divisible by 3, divide by 3.
   2. If X is divisible by 2, divide by 2.
   3. Subtract 1.

   Given an integer N, print the minimum number of operations used to make 1.
   - Parameter n: `(1 <= n <= 1000000)`
   - Returns: the minimum number of operations performed
 */
func makeOne(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = min(d[n-1] + 1, d[n/2] + 1, d[n/3] + 1) where n % 2 == 0 && n % 3 == 0
  
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 0
  for i in 2...n {
    d[i] = d[i - 1] + 1
    if i % 2 == 0 && d[i] > d[i / 2] + 1 {
        d[i] = d[i / 2] + 1
    }
    if i % 3 == 0 && d[i] > d[i / 3] + 1 {
        d[i] = d[i / 3] + 1
    }
  }
  return d[n]
}
