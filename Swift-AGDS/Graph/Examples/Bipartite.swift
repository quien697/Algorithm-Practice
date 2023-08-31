//
//  Bipartite.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/21.
//

import Foundation

func isBipartiteWithDFS() {

  func dfs(start: Int, color: Int, adjList: inout [[Int]], label: inout [Int]) {
    label[start] = color
    for v in adjList[start] {
      if label[v] == 0 {
        dfs(start: v, color: 3 - color, adjList: &adjList, label: &label)
      }
    }
  }
  
  let count = Int(readLine()!)!
  for _ in 0..<count {
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
    
    // Color
    // 0 -> not visited yet
    // 1 -> red
    // 2 -> blue
    var label = [Int](repeating: 0, count: n + 1)
    for v in 1...n {
      if label[v] == 0 {
        dfs(start: v, color: 1, adjList: &adjList, label: &label)
      }
    }
    
    // Verify
    for u in 0..<adjList.count {
      for j in 0..<adjList[u].count {
        let v = adjList[u][j]
        if label[u] == label[v] {
          print("No")
          return
        } else {
          
        }
      }
    }
    print("YES")
  }
}
