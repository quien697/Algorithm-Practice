//
//  TopologicalSort.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/10.
//

import Foundation

// Sample Input
//9 10
//1 4
//1 9
//2 4
//3 5
//4 7
//5 7
//5 6
//7 6
//6 8
//7 8
// Sample Output
//1
//2
//3
//4
//5
//7
//6
//8
//9

// DAG (directed acyclic graph)
func topologicalSort() {
  let firstLine = readLine()!.split(separator: " ").map{ Int($0)! }
  let N = firstLine[0]
  let M = firstLine[1]
  
  var adjList = [[Int]](repeating: [], count: N + 1)
  var indegree = [Int](repeating: 0, count: N + 1)
  
  for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    // u -> v
    adjList[u].append(v)
    indegree[v] += 1
  }
  
  // Topological Sort -> using BFS
  let queue = Queue<Int>()
  // chect the initial vertices with in-degree 0
  for v in 1...N {
    if indegree[v] == 0 {
      queue.enqueue(item: v)
    }
  }
  
  // BFS O(V+E)
  while !queue.isEmpty() {
    let u = queue.dequeue()!
    print(u) // print in topo;pgical order
    for v in adjList[u] {
      indegree[v] -= 1 // decrement indegree of all connected vertices from u
      if indegree[v] == 0 {
        queue.enqueue(item: v)
      }
    }
  }
}
