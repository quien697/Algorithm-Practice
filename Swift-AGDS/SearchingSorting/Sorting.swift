//
//  Sorting.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/16.
//

import Foundation

// O(N^2)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    for j in 0..<elements.count - i {
      if comparator(elements[j], elements[j-1]) {
        let temp = elements[j-1]
        elements[j-1] = elements[j]
        elements[j] = temp
      }
    }
  }
  return elements
}

// O(N^2)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    var indexMin = i
    for j in i+1..<elements.count {
      if comparator(elements[j], elements[indexMin]) {
        indexMin = j
      }
    }
    if i != indexMin {
      elements.swapAt(indexMin, i)
    }
  }
  return elements
}

// O(N^2)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let toInsert = elements[j]
    while j > 0 && comparator(toInsert, elements[j-1]) {
      elements[j] = elements[j-1]
      j -= 1
    }
    elements[j] = toInsert
  }
  return elements
}

// O(NlgN)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  // divide - O(lgN)
  let mid = arr.count / 2
  let leftSorted = mergeSort(Array(arr[0..<mid]), comparator)
  let rightSorted = mergeSort(Array(arr[mid...]), comparator)

  // conquer (merge) - O(N)
  return merge(leftSorted, rightSorted, comparator)
}

func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
    guard i < left.count else {
      merged.append(contentsOf: right[j...])
      break
    }
    
    guard j < right.count else {
      merged.append(contentsOf: left[i...])
      break
    }
    
    if comparator(left[i], right[j]) {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  return merged
}

// In "MOST" cases,
// QuickSort O(NlgN) (In the worst case, O(N^2) sorting in reverse order)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int, _ comparator: (T, T) -> Bool) {
  guard arr.count > 1, end > start else { return }
  
  // divide - O(lgN)
  let pivot = partition(&arr, start, end, comparator)
  // conquer (merge) - O(N)
  quickSort(&arr, start, pivot - 1, comparator)
  quickSort(&arr, pivot + 1, end, comparator)
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int, _ comparator: (T, T) -> Bool) -> Int {
  let pivot = arr[end]
  var i = start - 1
  
  for j in start..<end {
    if comparator(arr[j], pivot) {
      i += 1
      arr.swapAt(i, j)
    }
  }
  arr.swapAt(i+1, end)
  return i+1
}
