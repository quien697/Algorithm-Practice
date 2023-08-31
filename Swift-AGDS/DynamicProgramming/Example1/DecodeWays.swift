//
//  DecodeWays.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/26.
//

import Foundation

/**
 * LeetCode : 91. Decode Ways
 *
 * https://leetcode.com/problems/decode-ways/
 *
 * A message containing letters from A-Z can be encoded into numbers using the following mapping:
 
 - 'A' -> "1"
 - 'B' -> "2"
 - ...
 - 'Z' -> "26"
 
 * To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example,`"11106"` can be mapped into:
 - "`AAJF"` with the grouping `(1 1 10 6)`
 - `"KJF"` with the grouping `(11 10 6)`
 
 * Note that the grouping `(1 11 06)` is invalid because `"06"` cannot be mapped into`'F'` since `"6"` is different from `"06"`.
 
 * Given a string `s` containing only digits, return the number of ways to decode it.
 
 * The test cases are generated so that the answer fits in a 32-bit integer.
 
 - Parameter s: the string that containing only digits, `1 <= s.length <= 100`, `s` contains only digits and may contain leading zero(s).
 - Returns: the number of ways to decode it.
 */
func numDecodings(_ s: String) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = the number of ways to decode n digits
  // d[n] += d[n+1] where nums[n] != 0
  // d[n] += d[n+2] where 10 <= nums[n] * 10 + nums[n+1] <= 26
  
  let n = s.count
  let nums = Array(s).compactMap { Int(String($0)) }
  var d = [Int](repeating: 0, count: n + 1)
  if nums[0] == 0 { return 0 }
  
  d[n] = 1
  if nums[n-1] != 0 { d[n-1] = 1 }
  
  var i = n - 2
  while i >= 0 {
    if nums[i] != 0 {
      d[i] += d[i + 1]
    }
    let num = nums[i]*10 + nums[i+1]
    if num >= 10 && num <= 26 {
      d[i] += d[i + 2]
    }
    i -= 1
  }
  
  return d[0]
}
