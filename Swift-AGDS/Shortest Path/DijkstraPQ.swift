//
//  DijkstraPQ.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/18.
//

import Foundation

func DijkstraIPQ() {
  /// Dijkstra's shortest path algorithm with PriorityQueue
  /// Time Complexity:
  /// - Parameters:
  ///   - edges: the number of vertices from 1 to n
  ///   - src: the source vertex
  /// - Returns: the distance array
  func dijkstra(_ adj: inout [[CompEdge]], _ src: Int) -> [Int] {
    let n = adj.count
    var dist = [Int](repeating: Int.max, count: n)
    dist[src] = 0
    var pq = IndexPriorityQueue<CompEdge>(<)
    for edge in adj[src] {
      pq.enqueue(CompEdge(u: src, v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
      if edge.w < dist[edge.v] {
        dist[edge.v] = edge.w
        for e in adj[edge.v] {
          pq.enqueue(CompEdge(u: edge.v, v: e.v, w: e.w + edge.w))
        }
      }
    }
    
    return dist
  }
}
