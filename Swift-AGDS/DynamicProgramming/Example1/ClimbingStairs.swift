//
//  ClimbingStairs.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/21.
//

import Foundation

/**
 * LeetCode : 70. Climbing Stairs
 *
 * https://leetcode.com/problems/climbing-stairs/
 *
 * You are climbing a staircase. It takes `n` steps to reach the top.
 *
 * Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?
 
 - Parameter n: n steps to reach the top. (`1 <= n <= 45`)
 - Returns: how many distinct ways can you climb to the top
 */
func climbStairs(_ n: Int) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  if n < 2 { return d[n] }
  for i in 2...n {
    d[i] = d[i-1] + d[i-2]
  }
  return d[n]
}

func climbStairs2(_ n: Int) -> Int {
  // Using Top-Down Approach -> Recursion + Memorization.
  
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  helper(n, &d)
  return d[n]
}

@discardableResult
func helper(_ n: Int, _ d: inout [Int]) -> Int {
  if n < 2 { return 1 }
  if d[n] > 0 { return d[n] }
  let steps = helper(n-1, &d) + helper(n-2, &d)
  d[n] = steps
  return steps
}

