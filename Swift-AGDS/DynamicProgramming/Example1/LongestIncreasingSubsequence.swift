//
//  LongestIncreasingSubsequence.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/22.
//

import Foundation

/**
 * LeetCode : 300. Longest Increasing Subsequence
 *
 * https://leetcode.com/problems/longest-increasing-subsequence/
 *
 * Given an integer array nums, return the length of the longest strictly increasing subsequence.
 
 - Parameter nums: `1 <= nums.length <= 2500`, `-10 power of 4 <= nums[i] <= 10 power of 4`
 - Returns: the length of the longest increasing subsequence
 */
func lengthOfLIS(_ nums: [Int]) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // Time complexity: O(N^2)
  // Space complexity: O(N)
  // Recurrence: d[n] =
  
  let n = nums.count
  var d = [Int](repeating: 1, count: n)
  
  var maxCount = 1
  for i in 1..<n {
    var j = 0
    while i > j {
      if nums[i] > nums[j] && d[j] >= d[i] {
        d[i] = d[j] + 1
        maxCount = max(maxCount, d[i])
      }
      j += 1
    }
  }
  
  return maxCount
}

func lengthOfLIS2(_ nums: [Int]) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization. (Patience Sorting Algorithm)
  // Time complexity: O(N^2)
  // Space complexity: O(N)
  // Recurrence: d[n] =
  
  var d = [Int]()
  for num in nums {
    if let j = d.firstIndex(where: { $0 >= num }) {
      if num <= d[j] {
        d[j] = num
      }
    } else {
      d.append(num)
    }
  }
  return d.count
}

func lengthOfLIS3(_ nums: [Int]) -> Int {
  // Using Bottom-up Approach -> Tabulation + Memorization. (Patience Sorting Algorithm)
  // Time complexity: O(NlgN)
  // Space complexity:
  // Recurrence: d[n] =
  
  var d = [Int]()
  for num in nums {
    // Using Binary Search
    var lower = 0
    var upper = d.count
    while lower < upper {
      let mid = (upper + lower) / 2
      if d[mid] < num {
        lower = mid + 1
      } else {
        upper = mid
      }
    }
    if lower == d.count {
      d.append(num)
    } else {
      d[lower] = num
    }
  }
  return d.count
}
