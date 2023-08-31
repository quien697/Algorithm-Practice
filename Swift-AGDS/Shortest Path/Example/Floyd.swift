//
//  Floyd.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/20.
//

import Foundation

/**
 * Floyd Example
 *
 * There’s a fee (each time using a bus)
 *
 * Get the minimum costs for all pairs (A, B) from A to B.
 *
 - N (`1 <= N <= 100`) cities
 - There are m (`1 <= m <= 100,000`) busses.
 - Input
   - First line: N (the number of cities).
   - Second line: m (the number of busses).
   - Next m lines: u v c (u: starting city, v: destination, c: cost)
 - Output
   - Adjacency matrix for all cities
 */
func floyd() {
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  var adjMatrix = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let x = edge[0]
    let y = edge[1]
    let z = edge[2]
    if adjMatrix[x][y] == 0 {
      adjMatrix[x][y] = z
    } else {
      adjMatrix[x][y] = min(z, adjMatrix[x][y])
    }
  }
  // floyd-warshall
  for k in 1...n {
    for i in 1...n {
      for j in 1...n {
        if i == j { continue }
        if adjMatrix[i][k] != 0 && adjMatrix[k][j] != 0 {
          if adjMatrix[i][j] == 0 {
            adjMatrix[i][j] = adjMatrix[i][k] + adjMatrix[k][j]
          } else {
            adjMatrix[i][j] = min(adjMatrix[i][k] + adjMatrix[k][j], adjMatrix[i][j])
          }
        }
      }
    }
  }
  for row in adjMatrix {
    print(row)
  }
}

/**

Sample Input
5
14
1 2 2
1 3 3
1 4 1
1 5 10
2 4 2
3 4 1
3 5 1
4 5 3
3 5 10
3 1 8
1 4 2
5 1 7
3 4 2
5 2 4

Sample Output
0 2 3 1 4
12 0 15 2 5
8 5 0 1 1
10 7 13 0 3
7 4 10 6 0

 */
