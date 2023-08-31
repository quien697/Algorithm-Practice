//
//  DijkstraArray.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/18.
//

import Foundation

func dijkstraArray() {
  /// Dijkstra's shortest path algorithm with Array
  /// Time Complexity:
  /// - Parameters:
  ///   - edges: the number of vertices from 1 to n
  ///   - src: the source vertex
  /// - Returns: the distance array
  func dijkstra(_ edges: [(u: Int, v: Int, w: Int)], _ src: Int) -> [Int] {
    let n = edges.count
    var adjList = [[(v: Int,w : Int)]](repeating: [(Int, Int)](), count: n)
    for edge in edges {
      adjList[edge.u].append((v: edge.v, w: edge.w))
    }
    
    var dist = [Int](repeating: Int.max, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    // starting node src
    dist[src] = 0
    
    for _ in 0..<n-1 {
      var minWeight = Int.max
      var minVertex = 1
      for v in 1...n {
        if !check[v] && dist[v] < minWeight {
          minWeight = dist[v]
          minVertex = v
        }
      }
      check[minVertex] = true
      for edge in adjList[minVertex] {
        if dist[edge.v] > dist[minVertex] + edge.w {
          dist[edge.v] = dist[minVertex] + edge.w
        }
      }
    }
    
    return dist
  }
}
