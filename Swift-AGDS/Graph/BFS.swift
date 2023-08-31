//
//  BFS.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/21.
//

import Foundation

// BFS: Breadth First Search -> Queue
func adjacencyListBFS() {
  
  func bfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      print(vertex)
      for v in adjList[vertex] {
        if !visited[v] {
          queue.enqueue(item: v)
          visited[v] = true
        }
      }
    }
  }
  
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  // Adjacency list
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v) // undirected graph
    adjList[v].append(u) // undirected graph
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  bfs(start: 1, adjList: &adjList, visited: &visited)
}
