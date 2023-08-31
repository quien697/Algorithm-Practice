//
//  String.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/20.
//

import Foundation

func bruteForceStringSearch(_ text: String, _ pattern: String) -> Int? {
  if text.count < pattern.count {
    return nil
  }
  var index = 0
  while index <= text.count - pattern.count {
    count += 1
    if text[index, index+pattern.count] == pattern {
      return index
    }
    index += 1
  }
  return nil
}

func kmpStringSearch(_ text: String, _ pattern: String) -> Int? {
  
  return nil
}
