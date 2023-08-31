//
//  WhosMyParent.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/29.
//

import Foundation

func whosMyParentWithDFS() {
  // use stack of node to visit next node
  func dfsWithNode(start: (Int, Int), parent: inout [Int]) {
    let stack = Stack<(node: Int, parent: Int)>()
    stack.push(item: start)
    while !stack.isEmpty() {
      if let u = stack.pop() {
        parent[u.node] = u.parent
        for v in adjList[u.node] {
          if v != u.parent {
            stack.push(item: (node: v, parent: u.node))
          }
        }
      }
    }
  }
  
  // use stack in an array to visit next node
  func dfsWithArray(start: (Int, Int), parent: inout [Int]) {
    var stack: [(node: Int, parent: Int)] = []
    stack.append(start)
    while !stack.isEmpty {
      let u = stack.removeFirst()
      parent[u.node] = u.parent
      for v in adjList[u.node] {
        if v != u.parent {
          stack.append((node: v, parent: u.node))
        }
      }
    }
  }
  
  // Create the adjacency list
  let n = Int(readLine()!)!
  let m = n - 1
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adjList[u].append(v) // undirected graph
    adjList[v].append(u) // undirected graph
  }
  
  var parent = [Int](repeating: 0, count: n + 1)
  dfsWithNode(start: (1, 0), parent: &parent)
  // dfsWithArray(start: (1, 0), result: &result)
  
  // Print Result
  for i in 2...n {
    print(parent[i])
  }
}

func whosMyParentWithBFS() {
  // use queue of node to visit next node
  func bfs(start: Int, adjList: inout [[Int]], visited: inout [Bool], parent: inout [Int]) {
    let queue = Queue<(Int)>()
    queue.enqueue(item: start)
    visited[start] = true
    while !queue.isEmpty() {
      if let u = queue.dequeue() {
        for v in adjList[u] {
          if !visited[v] {
            visited[v] = true
            parent[v] = u
            queue.enqueue(item: v)
          }
        }
      }
    }
  }
  
  // Create the adjacency list
  let n = Int(readLine()!)!
  let m = n - 1
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adjList[u].append(v) // undirected graph
    adjList[v].append(u) // undirected graph
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  bfs(start: 1, adjList: &adjList, visited: &visited, parent: &parent)
  
  // Print Result
  for i in 2...n {
    print(parent[i])
  }
}
