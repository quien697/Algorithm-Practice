//
//  BellmanFord.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/19.
//

import Foundation

func BellmanFord() {
  /// Bellman-Ford shortest path algorithm
  /// Time Complexity: O(VE)
  /// - Parameters:
  ///   - edges: edge list
  ///   - n: the number of vertices from 1 to n
  ///   - src: the source vertex
  /// - Returns: the distance array
  func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int] {
    var dist = [Int](repeating: Int.max, count: n + 1)
    dist[src] = 0
    for _ in 0..<n-1 { // N - 1 times
      // Relax all edges
      for edge in edges {
        dist[edge.v] = min(dist[edge.v], dist[edge.u] + edge.w)
      }
    }
    return dist
  }
}
