//
//  LCA.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/4.
//

import Foundation

// Lowest Common Ancestor
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
func lca() {
  func bfs(start: Int, adjList: inout [[Int]], visited: inout [Bool], parent: inout [Int], depth: inout [Int]) {
    let queue = Queue<(Int)>()
    queue.enqueue(item: start)
    visited[start] = true
    while !queue.isEmpty() {
      if let u = queue.dequeue() {
        for v in adjList[u] {
          if !visited[v] {
            visited[v] = true
            parent[v] = u
            depth[v] = depth[u] + 1
            queue.enqueue(item: v)
          }
        }
      }
    }
  }
  
  let n = Int(readLine()!)!
  var m = n - 1
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  var depth = [Int](repeating: 0, count: n + 1)
  let start = 1
  bfs(start: start, adjList: &adjList, visited: &visited, parent: &parent, depth: &depth)
  
  // Next M
  print()
  m = Int(readLine()!)!
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    var u = edge[0]
    var v = edge[1]
    
    if depth[u] < depth[v] {
      swap(&u, &v)
    }
    while depth[u] != depth[v] {
      u = parent[u]
    }
    while u != v {
      u = parent[u]
      v = parent[v]
    }
    print(u)
  }
}
