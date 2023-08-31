//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var possibleCount = 0
func solveQueens(board: inout Board, row: Int = 0) {
  count += 1
  // base case
  if row == board.size {
    print(board)
    possibleCount += 1
    return
  }
  // recursion case
  for col in 0..<board.size {
    if board.isSafe(row: row, col: col) {
      // choose
      board.place(row: row, col: col)
      // explore
      solveQueens(board: &board, row: row + 1)
    }
    // un-choose
    board.remove(row: row, col: col)
  }
}

@discardableResult
func solveQueensWithBackTracking(board: inout Board, row: Int = 0) -> Bool {
  count += 1
  // base case
  if row == board.size {
    print(board)
    possibleCount += 1
    return true
  } else {
    // recursion case
    for col in 0..<board.size {
      if board.isSafe(row: row, col: col) {
        // choose
        board.place(row: row, col: col)
        // explore
        if solveQueensWithBackTracking(board: &board, row: row + 1) {
          return true
        }
      }
      // un-choose
      board.remove(row: row, col: col)
    }
    return false
  }
}

