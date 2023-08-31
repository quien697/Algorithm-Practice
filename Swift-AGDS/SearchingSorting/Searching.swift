//
//  Searching.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/16.
//

import Foundation

/// Linear Search - O(N)
/// - Parameters:
///   - collection: an array of equatable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return nil
}

/// Binary Search (Sorted Collections) - O(lg N)
/// - Parameters:
///   - collection: an array of comparable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
  var lower = 0
  var upper = collection.count - 1
  
  while lower <= upper {
    let mid = (lower + upper) / 2
    if collection[mid] == target {
      return mid
    } else if collection[mid] < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  return nil
}
