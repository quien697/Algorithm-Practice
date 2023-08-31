//
//  DFS.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/21.
//

import Foundation

// DFS: Depth First Search -> Stack, Recursion
func adjacencyListDFS() {
  
  func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[start] = true
    print(start)
    for v in adjList[start] {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
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
  dfs(start: 1, adjList: &adjList, visited: &visited)
}
