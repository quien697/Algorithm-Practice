//
//  Sushi.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/4.
//

import Foundation

/// Kazu is a blogger / computer scientist, specializing in the critique of Japanese restaurants. This month, he wants to visit all the Japanese restaurants in the Vancouver area, to see which one offers the best sushi.
/// There are N Japanese restaurants in Vancouver, numbered 0 to N - 1. However, only M of them offer “real” sushi. Kazu can choose to start at any restaurant. There are N - 1 roads in Vancouver, each connecting exactly two restaurants. It is possible to reach every restaurant from any restaurant using these roads. It takes Kazu exactly 1 minute to travel along any road.
/// In computer science, a road network with this structure is called a tree/graph. One property that is true for all trees is that there is exactly one path that does not repeat any roads between any two points in the tree. (no multiple edges / cycles)
/// What is the minimal length of time that Kazu needs to spend on traveling on roads to visit all the real sushi restaurants?
/// (Make sure your program passes all test cases.)
/// * Input Specification
/// The first line of input contains 2 integers, `𝑁` and `𝑀`.
/// `( 2 ≤ 𝑀 ≤ 𝑁 ≤ 100,000)`
/// The second line of input contains 𝑀 distinct integers indicating the Japanese restaurants which offer real sushi.
/// The next 𝑁 - 1 lines contain 2 integers each. The ithline contains aiand bi (0 ≤ ai , bi ≤ N - 1) , representing a path between the two restaurants numbered ai and bi.
/// * Output Specification
/// Your program should output one line, containing one integer - the minimum amount of time Kazu needs to spend traveling on roads in order to visit all Japanese restaurants that offer real sushi, in minutes.

// Sample Input 1
//8 2
//5 2
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3
// Sample Output 1
//3
// Explanation for output1
// The path between 5 and 2 goes through 5 -> 1 -> 0 -> 2, which uses 3 roads.


// Sample Input 2
//8 5
//0 6 4 3 7
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3
// Sample Output 2
//7
// Explanation for output2
// If Kazu begins at restaurant 6, he will only need to use 7 roads.
// One possible path that he can take is:
// 6 -> 1 -> 0 -> 2 -> 3 -> 7 -> 3 -> 4
// Notice that he doesn’t need to visit restaurant 5, since it is not a Japanese restaurant that offers real sushi.

/// Sushi Restaurant with the input from user
func shshi() {
  func solution() {
    // Create a adjacency List
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])! // n japenses restaurants
    
    var adjList = [[Int]](repeating: [], count: n)
    var realSushi = [Bool](repeating: false, count: n)
    let secondLine = readLine()!.split(separator: " ").map { Int($0)! }
    
    for i in secondLine {
      realSushi[i] = true
    }
    
    for _ in 0..<n-1 {
      let edge = readLine()!.split(separator: " ").map { Int($0)! }
      let u = edge[0]
      let v = edge[1]
      adjList[u].append(v)
      adjList[v].append(u)
    }
    // remove nodes that no longer needs
    for i in 0..<adjList.count {
      removeNode(at: i, adjList: &adjList, realSushi: &realSushi)
    }
    
    // calculate what is the started node
    var start = -1
    for i in 0..<adjList.count {
      if start != -1 { break }
      if adjList[i][0] != Int.max {
        start = i
      }
    }
    // BFS
    var result: (node: Int, distance: Int) = (node: 0, distance: 0)
    bfs(start: start, n: n, adjList: &adjList, result: &result)
    bfs(start: result.node, n: n, adjList: &adjList, result: &result)
    adjList = adjList.filter{ $0[0] != Int.max }
    print((adjList.count - 1) * 2 - result.distance)
  }
  
  func removeNode(at node: Int, adjList: inout [[Int]], realSushi: inout [Bool]) {
    if realSushi[node] || adjList[node].count != 1 || adjList[node][0] == Int.max  {
      return
    } else {
      let u = adjList[node][0]
      for (i, v) in adjList[u].enumerated() {
        if v == node {
          adjList[u].remove(at: i)
          
        }
      }
      adjList[node] = [Int.max]
      removeNode(at: u, adjList: &adjList, realSushi: &realSushi)
    }
  }
  
  func bfs(start: Int, n: Int, adjList: inout [[Int]], result: inout (node: Int, distance: Int)) {
    var visited = [Bool](repeating: false, count: n)
    var distance = [Int](repeating: 0, count: n)
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    
    while !queue.isEmpty() {
      if let u = queue.dequeue() {
        for v in adjList[u] {
          if v != Int.max {
            if !visited[v] {
              queue.enqueue(item: v)
              distance[v] = distance[u] + 1
              visited[v] = true
            }
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
  solution()
}


/// Sushi Restaurant with input from testing in-out files
func shshi(input: String) {
  
  func solution () {
    // Create a adjacency List
    let inputLines = input.components(separatedBy: "\n").filter({ $0 != "" })
    let firstLine = inputLines[0].components(separatedBy: " ").map { Int($0)! }
    
    let n = firstLine[0] // n japenses restaurants
    var sushiMap = [[Int]](repeating: [], count: n)
    var realSushi = [Int:Bool]() // [node:isReal]
    
    let secondLine = inputLines[1].components(separatedBy: " ").map { Int($0)! }
    for i in secondLine {
      realSushi[i] = true
    }
    
    for i in 2...n {
      let edge = inputLines[i].components(separatedBy: " ").map { Int($0)! }
      let u = edge[0]
      let v = edge[1]
      sushiMap[u].append(v)
      sushiMap[v].append(u)
    }

    // remove nodes that no longer needs
    for i in 0..<sushiMap.count {
      removeNode(at: i, sushiMap: &sushiMap, realSushi: &realSushi)
    }
    
    // calculate what is the started node
    var start = -1
    for i in 0..<sushiMap.count {
      if start != -1 { break }
      if sushiMap[i][0] != Int.max {
        start = i
      }
    }
    // BFS
    var result: (node: Int, distance: Int) = (node: 0, distance: 0)
    bfs(start: start, n: n, sushiMap: &sushiMap, result: &result)
    bfs(start: result.node, n: n, sushiMap: &sushiMap, result: &result)
    sushiMap = sushiMap.filter{ $0[0] != Int.max }
    print((sushiMap.count - 1) * 2 - result.distance)
  }
  
  func removeNode(at node: Int, sushiMap: inout [[Int]], realSushi: inout [Int:Bool]) {
    if !(realSushi[node] ?? false) && sushiMap[node].count == 1 && sushiMap[node][0] != Int.max  {
      let u = sushiMap[node][0]
      var i = 0
      while i < sushiMap[u].count {
        if sushiMap[u][i] == node {
          sushiMap[u].remove(at: i)
          break
        }
        i += 1
      }
      sushiMap[node] = [Int.max]
      removeNode(at: u, sushiMap: &sushiMap, realSushi: &realSushi)
    }
  }
  
  // use queue of node to visit next node
  func bfs(start: Int, n: Int, sushiMap: inout [[Int]], result: inout (node: Int, distance: Int)) {
    var visited = [Bool](repeating: false, count: n)
    var distance = [Int](repeating: 0, count: n)
    let queue = Queue<Int>()
    queue.enqueue(item: start)
    visited[start] = true
    
    while !queue.isEmpty() {
      if let u = queue.dequeue() {
        for v in sushiMap[u] {
          if v != Int.max {
            if !visited[v] {
              queue.enqueue(item: v)
              distance[v] = distance[u] + 1
              visited[v] = true
            }
          }
        }
      }
    }
    
    // Find the longest distance
    for i in 0..<distance.count {
      if distance[i] > result.distance {
        result.node = i
        result.distance = distance[i]
      }
    }
  }
  
  solution()
}
