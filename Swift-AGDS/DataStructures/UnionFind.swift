//
//  UnionFind.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/12.
//

import Foundation

/**
 The UF struct represents a union-find (disjoint sets) data structure
 
 It supports **union** **and** **find** operations, along with methods for determining whether two nodes are in the same component and the total determining whether two nodes are in the same component and the total number of components.
 
 This implementation uses weighted quick union (by size or rank) with full path compression.
 
 Initializing a data structure with **n** nodes takes linear time.
 
 Afterwards, **union**, **find**, **and** **connected** take logarithmic time (in the worst case) and mcount takes constant time.
 
 Moreover, the amortized time per **union**, **find**, **and** **connected** operation has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
 */
public struct UnionFind {
  /// parent[i] = parent of i
  private var parent: [Int]
  /// size[i] = number of nodes in tree rooted at i
  private var size: [Int]
  /// Number of components
  private(set) var count: Int
  
  /// Initializes an empty union-find data structure with **n** elements
  /// **0** through **n-1**.
  /// Initially, each elements is in its own set.
  /// - Parameter n: the number of elements
  public init(_ n: Int) {
    self.parent = [Int](repeating: 0, count: n)
    for i in 0..<n { self.parent[i] = i }
    self.size = [Int](repeating: 1, count: n)
    self.count = n
  }
  
  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    // Find the rott
    var root = p
    while parent[root] != root {
      root = parent[root]
    }
    // Path compression
    var p = p
    while p != root {
      let newP = parent[p]
      parent[p] = root
      p = newP
    }
    return root
  }
  
  /// Returns `true` if the two elements are in the same set.
  /// - Parameters:
  ///   - p: one elememt
  ///   - q: the other element
  /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
  public mutating func connected(_ p: Int, _ q: Int) -> Bool {
    return find(p) == find(q)
  }
  
  /// Merges the set containing element `p` with the set containing
  /// element `q`
  /// - Parameters:
  ///   - p: one element
  ///   - q: the other element
  public mutating func union(_ p: Int, _ q: Int) {
    let rootP = find(p)
    let rootQ = find(q)
    // Check if it is already connected
    if rootP == rootQ { return }
    // Make smaller root point to larger one
    if size[rootP] < size[rootQ] {
      parent[rootP] = rootQ
      size[rootQ] += size[rootP]
    } else {
      parent[rootQ] = rootP
      size[rootP] += size[rootQ]
    }
    count -= 1
  }
}
