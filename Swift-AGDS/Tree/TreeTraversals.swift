//
//  TreeTraversals.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/5.
//

import Foundation

// Sample Input
//7
//A B C
//B D .
//C E F
//E . .
//F . G
//D . .
//G . .
// Sample Output
//ABDCEFG
//DBAECFG
//DBEGFCA

/// First Line: N (# of nodes, 1 <= N <= 26)
/// N lines: node, left-child, right-child  (no-child: .)
/// Output: Pre-order, In-order, Post-order (each line)
/// (A is the root node)
func preOrder(_ node: Int) {
  if node == -1 { return }
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  preOrder(tree[node][0])
  preOrder(tree[node][1])
}

func inOrder(_ node: Int) {
  if node == -1 { return }
  inOrder(tree[node][0])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  inOrder(tree[node][1])
}

func postOrder(_ node: Int) {
  if node == -1 { return }
  postOrder(tree[node][0])
  postOrder(tree[node][1])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)

func treeTraversal() {
  // get user input and store in our 2D data structure
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    // A, B, C, ..., Z
    let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
    let l = Int(Character(nodeInfo[1]).asciiValue!)
    let r = Int(Character(nodeInfo[2]).asciiValue!)
    // ascii 46 -> . -> -1
    tree[x][0] = l == 46 ? -1 : l - 65
    tree[x][1] = r == 46 ? -1 : r - 65
  }
  
  preOrder(0)
  print()
  inOrder(0)
  print()
  postOrder(0)
  print()
}
