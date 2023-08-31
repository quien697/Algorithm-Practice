//
//  MaximumSubarray.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/5/1.
//

import Foundation

/**
 * LeetCode: 53. Maximum Subarray
 *
 * https://leetcode.com/problems/maximum-subarray/
 *
 * Given an integer array nums, find the subarray with the largest sum, and return its sum.
 *
  - Parameter nums: an integer array nums
  - Returns: the contiguous subarray (containing at least one number) which has the largest sum and return its sum
 */

func maxSubArray(_ nums: [Int]) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // d[n] = the largest sum where nums[n] is the last element
  // d[n] = max(d[n], d[n] + d[n-1]) where 0 < d[n-1] < nums[n]
  
  let n = nums.count
  if n == 1 { return nums[0] }
  var d = [Int](repeating: 0, count: n)
  d[0] = nums[0]
  for i in 1..<n {
    if nums[i] > d[i-1] && d[i-1] < 0 {
      d[i] = nums[i]
    } else {
      d[i] = nums[i] + d[i-1]
    }
  }
  return d.max()!
}
