//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/30.
//

import Foundation

func diameter() {
  
  // use queue of node to visit next node
  func bfs(start: Int, adjList: inout [[(Int, Int)]], result: inout (node: Int, distance: Int)) {
    var visited = [Bool](repeating: false, count: n + 1)
    var distance = [Int](repeating: 0, count: n + 1)
    let queue = Queue<(v: Int, w: Int)>()
    queue.enqueue(item: (v: start, w: 0))
    visited[start] = true
    
    while !queue.isEmpty() {
      if let (vertex, _) = queue.dequeue() {
        for (v, w) in adjList[vertex] {
          if !visited[v] {
            queue.enqueue(item: (v: v, w: w))
            distance[v] = distance[vertex] + w
            visited[v] = true
          }
        }
      }
    }
    // Find the longest distance
    for i in 2..<distance.count {
      if distance[i] > result.distance {
        result.node = i
        result.distance = distance[i]
      }
    }
  }
  
  // Create the adjacency list
  let n = Int(readLine()!)!
  var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<n {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    var i = 1
    while i <= edge.count {
      if edge[i] == -1 {
        break
      }
      adjList[u].append((edge[i], edge[i+1])) // undirected graph
      i += 2
    }
  }
  var result: (node: Int, distance: Int) = (node: 0, distance: 0)
  bfs(start: 1, adjList: &adjList, result: &result)
  bfs(start: result.node, adjList: &adjList, result: &result)
  print(result.distance)
}
