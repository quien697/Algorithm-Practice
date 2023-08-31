//
//  EqualSubsetSubPartition.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/5/1.
//

import Foundation

/**
 * Equal Subset Sub Partition Using Recurive way
 *
 * Given a set of positive numbers, find if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 
 - Parameter nums: an integer of  array
 - Returns: return trure if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 */
func canPartition(_ nums: [Int]) -> Bool {
  // recurive way

  let s = nums.reduce(0, +)
  if s % 2 != 0 { return false }
  return canPartitionHelper(nums: nums, sum: s / 2, index: 0)
}

func canPartitionHelper(nums: [Int], sum: Int, index: Int) -> Bool {
  if sum == 0 { return true }
  if index >= nums.count || nums.count == 0 { return false }
  if nums[index] <= sum {
    if (canPartitionHelper(nums: nums, sum: sum - nums[index], index: index + 1)) {
      return true
    }
  }
  return canPartitionHelper(nums: nums, sum: sum, index: index + 1)
}

/**
 * Equal Subset Sub Partition Using Top-down Approach -> Recursion + Memorization
 *
 * Given a set of positive numbers, find if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 
 - Parameter nums: an integer of  array
 - Returns: return trure if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 */
func canPartitionUpDown(_ nums: [Int]) -> Bool {
  // Using Top-down Approach -> Recursion + Memorization
  // Time complexity : O(n * s)
  // Space complexity : S(n * s)
  
  let n = nums.count
  let s = nums.reduce(0, +)
  let halfSum = s / 2
  if s % 2 != 0 {
    return false
  }
  var d = [[Bool]](repeating: [Bool](repeating: false, count: halfSum + 1), count: n)
  return canPartitionUpDownHelper(nums: nums, sum: halfSum, index: 0, d: &d)
}

func canPartitionUpDownHelper(nums: [Int], sum: Int, index: Int, d: inout [[Bool]]) -> Bool {
  if sum == 0 { return true }
  if index >= nums.count || nums.count == 0 { return false }
  
  if !d[index][sum] {
    if nums[index] <= sum {
      if canPartitionUpDownHelper(nums: nums, sum: sum - nums[index], index: index + 1, d: &d) {
        d[index][sum] = true
        return d[index][sum]
      }
    }
    d[index][sum] = canPartitionUpDownHelper(nums: nums, sum: sum, index: index + 1, d: &d)
  }
  return d[index][sum]
}

/**
 * Equal Subset Sub Partition Using Top-down Approach -> Recursion + Memorization.
 *
 * Given a set of positive numbers, find if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 
 - Parameter nums: an integer of  array
 - Returns: return trure if we can partition it into two subsets such that the sum of elements in both the subsets is equal.
 */
func canPartitionBottomUp(_ nums: [Int]) -> Bool {
  // Using Top-down Approach -> Recursion + Memorization
  // Time complexity : O(n * s)
  // Space complexity : S(n * s)
  // Recurrence
  // d[n][s] = d[n-1][s] if we can get the sum 's' without the number at index n
  // d[n][s] = d[n-1][s-nums[n]] if we can find a subset to get the remaining sum

  let n = nums.count
  var sum = nums.reduce(0, +)
  if sum % 2 != 0 { return false }
  sum /= 2
  var d = [[Bool]](repeating: [Bool](repeating: false, count: sum + 1), count: n)
  // Base case
  for i in 0..<n { d[i][0] = true }
  for s in 1...sum { d[0][s] = (nums[0] == s) ? true : false }
  
  for i in 1..<n {
    for s in 1..<sum {
      if d[i-1][s] {
        d[i][s] = d[i-1][s]
      } else if nums[i] <= sum {
        d[i][s] = d[i-1][s-nums[i]]
      }
    }
  }
  return d[n-1][sum]
}

// MARK: - Sample Input & Out put

/**
 
 Sample 1:
 Input: [1, 2, 3, 4]
 Output: True
 Explanation: The given set can be partitioned into two subsets with equal sum: {1, 4} & {2, 3}
 
 Sample 2:
 Input: [1, 1, 3, 4, 7]
 Output: True
 Explanation: The given set can be partitioned into two subsets with equal sum: {1, 3, 4} & {1, 7}
 
 Sample 3:
 Input: [2, 3, 4, 6]
 Output: False
 Explanation: The given set cannot be partitioned into two subsets with equal sum.

 */
