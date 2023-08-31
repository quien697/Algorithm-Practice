//
//  OneTwoThree.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/22.
//

import Foundation

/**
 * One Two Three

 * There are 7 ways to represent the integer 4 as the sum of 1, 2, and 3.
 * You must use one or more numbers to represent the sum.
 - 1 + 1 + 1 + 1
 - 1 + 1 + 2
 - 1 + 2 + 1
 - 2 + 1 + 1
 - 2 + 2
 - 1 + 3
 - 3 + 1
 
 * Given an integer n, write a program to find the number of ways to represent n as the sum of 1, 2 and 3.
 
 * **Input Specification**
   - T (# of test cases)
   - Next T lines: each test case consists of a single line, given the integer n.
   - (1 <= n <= 11)
 
 * **Output Specification**
 
 * For each test case, the number of ways to represent n as the sum of 1, 2, and 3.

 - Parameter n: `(1 <= n <= 11)`
 - Returns: the number of ways to represent n as the sum of 1, 2, and 3.
 */
func OneTwoThree() {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = d[n-1] + d[n-2] + d[n-3]
  
  let T = Int(readLine()!)!
  var arr = [Int]()
  for _ in 0..<T {
    arr.append(Int(readLine()!)!)
  }
  for n in arr {
    var d = [Int](repeating: 0, count: n + 1)
    d[0] = 1
    d[1] = 1
    d[2] = 2
    if n > 2 {
      for i in 3...n {
        d[i] = d[i-1] + d[i-2] + d[i-3]
      }
    }
    print(d[n])
  }
}

/**
 
Sample Input1
3
4
7
10

Sample Output1
7
44
274
 
 */
