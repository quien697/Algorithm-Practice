//
//  Pokemon.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/24.
//

import Foundation

/**
 * Pokemon

 * N x M grid. Every square has some candies. Pikachu is located at the top-left corner of the N x M grid (1, 1). Pikachu can only move either down or right at any point in time. Pikachu is trying to reach the bottom-right corner of the grid while trying to collect the most candies possible.

 * Given an N x M grid with the number of candies in each square, write a program to collect the most number of candies.

 * **Input Specification**
   - N M (`1 <= N, M <= 1000`)
   - N lines to represent the grid with candies.

 * **Output Specification**
 
 * The maximum number of candies.
 */
func Pokemon() {
  // Using Bottom-up Approach -> Tabulation + Memorization.
  // recurrence
  // dp[i][j] = max(dp[i-1][j] + grid[i][j], dp[i][j-1] + grid[i][j]) where grid is the given grid
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let N = firstLine[0]
  let M = firstLine[1]
  var grid = [[Int]]()
  for _ in 0..<N {
    let points = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(points)
  }
  
  var d = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
  
  for i in 0..<N {
    for j in 0..<M {
      d[i][j] = grid[i][j]
      if i - 1 >= 0 {
        d[i][j] = max(d[i][j], d[i-1][j] + grid[i][j])
      }
      if j - 1 >= 0 {
        d[i][j] = max(d[i][j], d[i][j-1] + grid[i][j])
      }
    }
  }
  print(d[N-1][M-1])
}


/**
 
Sample Input1
3 4
1 2 3 4
0 0 0 5
9 8 7 6
 
Sample Output1
31
 
Sample Input2
3 3
1 0 0
0 1 0
0 0 1
 
Sample Output2
3

Sample Input3
4 3
1 2 3
6 5 4
7 8 9
12 11 10
 
Sample Output3
47
 
 */
