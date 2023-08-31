//
//  CyclicPermutation.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/24.
//

import Foundation

/// https://en.wikipedia.org/wiki/Cyclic_permutation
func cyclicPermutation() {
  
  func dfs(start: Int, nodes: inout [Int], check: inout [Bool]) {
    if check[start] {
      return
    }
    check[start] = true
    dfs(start: nodes[start], nodes: &nodes, check: &check)
  }
  
  var tests = Int(readLine()!)!
  while tests > 0 {
    let n = Int(readLine()!)!
    var nodes = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.insert(0, at: 0)
    var check = [Bool](repeating: false, count: n + 1)
    var count = 0
    for v in 1...n {
      if !check[v] {
        dfs(start: v, nodes: &nodes, check: &check)
        count += 1
      }
    }
    print(count)
    tests -= 1
  }
}
