//
//  2xNTiles.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/21.
//

import Foundation

/// 2 x N tiles
/// Count how many possible ways you can fill up the 2xN tiles by using `2x1` tiles and `1x2` tiles (blue tiles).
/// - Parameter n: `(1 <= n <= 100)`
/// - Returns: the number of ways to fill up the 2 x N tiles
func twoByNTiles(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = d[n - 1] + d[n - 2]
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  for i in 2...n {
    d[i] = d[i - 1] + d[i - 2]
  }
  return d[n]
}

/// Count how many possible ways you can fill up the 2xN tiles by using `1x2` tiles, `2x1` tiles and `2x2` tiles (blue tiles).
/// - Parameter n: `(1 <= n <= 100)`
/// - Returns: the number of ways to fill up the 2 x N tiles
func twoByNTiles2(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = d[n-1] + (d[n-2] * 2)
  
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  for i in 2...n {
    d[i] = d[i - 1] + (d[i - 2] * 2)
  }
  return d[n]
}
