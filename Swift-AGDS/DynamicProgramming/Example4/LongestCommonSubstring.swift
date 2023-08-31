//
//  LongestCommonSubstring.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/5/2.
//

import Foundation

/**
 * Longest Common Substring Using Top-down Approach -> Recursion + Memorization
 *
 * Given two strings ‘s1’ and ‘s2’, find the length of the longest substring which is common in both the strings.
 *
 * Example 1:
 *
 * Input: s1 = "abdca", s2 = "cbda"
 *
 * Output: 2
 *
 * Explanation: The longest common substring is "bd".
 *
 * Example 2:
 *
 * Input: s1 = "passport", s2 = "ppsspt"
 *
 * Output: 3
 * Explanation: The longest common substring is "ssp".
 
- Parameters:
  - s1: an string
  - s2: an string
  - Returns: the length of the longest substring which is common in both the strings.
 */
func LCSubstringUpDown(s1: String, s2: String) -> Int {
  // Using Top-down Approach -> Recursion + Memorization
  // Time complexity : O(m * n)
  // Space complexity : S(m * n)
  
  let m = s1.count
  let n = s2.count
  let maxLength = max(m, n)
  var d = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: maxLength), count: n), count: m)
  return LCSubStringUpDownHelper(s1: s1, s2: s2, i1: 0, i2: 0, count: 0, d: &d)
}

func LCSubStringUpDownHelper(s1: String, s2: String, i1: Int, i2: Int, count: Int, d: inout [[[Int]]]) -> Int {
  if i1 == s1.count || i2 == s2.count { return count }
  
  if d[i1][i2][count] == 0 {
    var c1 = count
    if s1[i1] == s2[i2] {
      c1 = LCSubStringUpDownHelper(s1: s1, s2: s2, i1: i1 + 1, i2: i2 + 1, count: count + 1, d: &d)
    }
    let c2 = LCSubStringUpDownHelper(s1: s1, s2: s2, i1: i1 + 1, i2: i2, count: 0, d: &d)
    let c3 = LCSubStringUpDownHelper(s1: s1, s2: s2, i1: i1, i2: i2 + 1, count: 0, d: &d)
    d[i1][i2][count] = max(c1, max(c2, c3))
  }
  
  return d[i1][i2][count]
}

/**
 * Longest Common Substring Using Bottom-up Approach -> Tabulation + Memorization.
 *
 * Given two strings ‘s1’ and ‘s2’, find the length of the longest substring which is common in both the strings.
 *
 * Example 1:
 *
 * Input: s1 = "abdca", s2 = "cbda"
 *
 * Output: 2
 *
 * Explanation: The longest common substring is "bd".
 *
 * Example 2:
 *
 * Input: s1 = "passport", s2 = "ppsspt"
 *
 * Output: 3
 * Explanation: The longest common substring is "ssp".
 
- Parameters:
  - s1: an string
  - s2: an string
  - Returns: the length of the longest substring which is common in both the strings.
 */
func LCSubstringBottomUp(s1: String, s2: String) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // Time complexity : O(m * n)
  // Space complexity : S(m * n)
  // Recurrence:
  // d[i][j] = d[i-1][j-1] + 1 where s1[i] == s2[j]

  let m = s1.count
  let n = s2.count
  var d = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
  var reuslt = 0
  for i in 1...m {
    for j in 1...n {
      if s1[i-1] == s2[j-1] {
        d[i][j] = d[i-1][j-1] + 1
        reuslt = max(reuslt, d[i][j])
      }
    }
  }
  return reuslt
}
