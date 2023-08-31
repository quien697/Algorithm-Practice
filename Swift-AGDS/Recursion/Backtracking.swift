//
//  Backtracking.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/13.
//

import Foundation

func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  // base case: when to stop (no decisions to make)
  if n == 0 {
    print(choices)
  } else {
    // recursive
    // for all possible choices
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceHelper(n-1, choices: &choices)
      // un-choice
      choices.removeLast()
    }
  }
}

// MARK: - Backtracking Problem

var rollDiceSumCount = 0

func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, sum, choices: &choices)
}

func rollDiceSumHelper(_ n: Int, _ sum: Int, choices: inout [Int]) {
  rollDiceSumCount += 1
  // base case: when to stop (no decisions to make)
  if n == 0 {
    if sum == 0 {
      print(choices)
    }
  } else {
    // recursive
    // for all possible choices
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceSumHelper(n-1, sum-i, choices: &choices)
      // un-choose
      choices.removeLast()
    }
  }
}

// MARK: - Backtracking Problem - Optimized

var rollDiceSumBetterCount = 0

func rollDiceSumBetter(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumBetterHelper(n, sum, 0, &choices)
}

func rollDiceSumBetterHelper(_ n: Int, _ sum: Int, _ soFar: Int, _ choices: inout [Int]) {
  rollDiceSumBetterCount += 1
  if n == 0 {
    if soFar == sum {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if ( (soFar + i + 1 * (n - 1) <= sum) && (soFar + i + 6 * (n - 1) >= sum) ) {
        choices.append(i)
        rollDiceSumBetterHelper(n - 1, sum, soFar + i, &choices)
        choices.removeLast()
      }
    }
  }
}
