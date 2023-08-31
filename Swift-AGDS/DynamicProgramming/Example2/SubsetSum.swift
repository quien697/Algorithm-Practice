//
//  SubsetSum.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/5/1.
//

import Foundation

func subsetSum(_ nums: [Int], _ S: Int) -> Bool {
  let n = nums.count
      var dp = Array(repeating: Array(repeating: 0, count: S + 1), count: n + 1)
      
      // if sum is 0, then answer is always true
      for i in 0...n {
          dp[i][0] = 0
      }
      
      // check for all sum values from 1 to S
      for i in 1...n {
          for j in 1...S {
              // exclude the current number
              dp[i][j] = dp[i - 1][j]
              
              // include the current number, if it is less than or equal to the sum
              if j >= nums[i - 1] {
                  let remainingSum = j - nums[i - 1]
                  if dp[i - 1][remainingSum] != 0 || remainingSum == 0 {
                      dp[i][j] = dp[i - 1][remainingSum] + nums[i - 1]
                  }
              }
          }
      }
      print(dp)
      // return true if a subset with sum equal to S exists, else false
      return dp[n][S] == S
  }
