//
//  MinimumCostFlow.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/17.
//

import Foundation

func minimumCostFlow() {
  
  func solution() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    let D = firstLine[2]
    
    var pipes = [(u: Int, v: Int, w: Int, a: Bool)]()
    for i in 0..<M {
      let pipe = readLine()!.split(separator: " ").map { Int($0)! }
      let A = pipe[0]
      let B = pipe[1]
      let C = pipe[2]
      let isActive = i < N-1 ? true : false
      pipes.append((u: A, v: B, w: C, a: isActive))
    }
    
    // Get the index and pipe that `a` = true and `w` is the largest
    if let (index, largestPipe) = pipes.enumerated()
      .filter({ $0.element.a })
      .max(by: { $0.element.w < $1.element.w }) {
        pipes[index].w = (largestPipe.w - D) > 0 ? largestPipe.w - D : 0
    }
    // sort
    pipes.sort { (pipe1, pipe2) -> Bool in
      if pipe1.w != pipe2.w {
        return pipe1.w < pipe2.w // Sort by `w` values
      } else {
        return pipe1.a && !pipe2.a // Sort `a` values with `true` first
      }
    }
    // Union Find
    var days = 0
    var mstEdges = [(u: Int, v: Int, w: Int, a: Bool)]()
    var uf = UnionFind(N + 1)
    for pipe in pipes {
      if uf.connected(pipe.u, pipe.v) {
        continue
      }
      if pipe.a == false { days += 1 }
      mstEdges.append(pipe)
      uf.union(pipe.u, pipe.v)
    }
    print(days)
    
  }
  
  solution()
}


func minimumCostFlow(input: String) {
  func solution() {
    let inputLines = input.components(separatedBy: "\n").filter({ $0 != "" })
    let firstLine = inputLines[0].components(separatedBy: " ").map { Int($0)! }
    let N = firstLine[0]
    let M = firstLine[1]
    let D = firstLine[2]
    // store all pipes to tuple of array
    var pipes = [(u: Int, v: Int, w: Int, a: Bool)]()
    for i in 1...M {
      let pipe = inputLines[i].components(separatedBy: " ").map { Int($0)! }
      let A = pipe[0]
      let B = pipe[1]
      let C = pipe[2]
      let isActive = i <= N-1 ? true : false
      pipes.append((u: A, v: B, w: C, a: isActive))
    }
//    // First sort
//    pipes.sort { (pipe1, pipe2) -> Bool in
//      if pipe1.a && !pipe2.a {
//        return true // Sort `a` values with `true` first
//      } else if !pipe1.a && pipe2.a {
//        return false // Sort `a` values with `false` first
//      } else {
//        return pipe1.w > pipe2.w // Sort by `w` values in descending order
//      }
//    }
//    //
//    let firstPipe = pipes.first!
//    pipes[pipes.startIndex].w = (firstPipe.w - D) > 0 ? firstPipe.w - D : 0

    // Get the index and pipe that `a` = true and `w` is the largest
    if let (index, largestPipe) = pipes.enumerated()
      .filter({ $0.element.a })
      .max(by: { $0.element.w < $1.element.w }) {
        pipes[index].w = (largestPipe.w - D) > 0 ? largestPipe.w - D : 0
    }
    // Second sort
    pipes.sort { (pipe1, pipe2) -> Bool in
      if pipe1.w != pipe2.w {
        return pipe1.w < pipe2.w // Sort by `w` values
      } else {
        return pipe1.a && !pipe2.a // Sort `a` values with `true` first
      }
    }
    // Union Find
    var days = 0
    var mstEdges = [(u: Int, v: Int, w: Int, a: Bool)]()
    var uf = UnionFind(N + 1)
    for pipe in pipes {
      if uf.connected(pipe.u, pipe.v) {
        continue
      }
      if pipe.a == false { days += 1 }
      mstEdges.append(pipe)
      uf.union(pipe.u, pipe.v)
    }
    print(days)
  }
  
  solution()
}
