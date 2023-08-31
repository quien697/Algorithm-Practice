//
//  PathFinding.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/20.
//

import Foundation

/**
 * Path Finding Example

 * Unweighted graph G, write a program to find a path from i to j for all vertices (i, j).

 * **Input Specification**

   - first line: N (`1 <= N <= 100`) # of vertices.
   - N lines: adjacency matrix. 1: edge exists, 0: no edge.

 * **Output Specification**

 * Print the correct answer in the form of adjacency matrix. If there’s a path from i to j, i’th row and j’th col should be 1, otherwise 0.
 */
func pathFinding() {
  let n = Int(readLine()!)!
  var adjMatrix = [[Int]]()
  for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    adjMatrix.append(line)
  }

  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        if adjMatrix[i][k] == 1 && adjMatrix[k][j] == 1 {
          adjMatrix[i][j] = 1
        }
      }
    }
  }
  
  for row in adjMatrix {
    for col in row {
      print("\(col) ", terminator: "")
    }
    print()
  }
}
