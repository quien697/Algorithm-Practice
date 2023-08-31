//
//  CourseSchedule2.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/11.
//

import Foundation

// LeetCode: 210. Course Schedule II
// https://leetcode.com/problems/course-schedule-ii/
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  // create a adjList
  var adjList = [[Int]](repeating: [], count: numCourses)
  var indegree = [Int: Int]()
  var result = [Int]()
  for prerequisite in prerequisites {
    let u = prerequisite[1]
    let v = prerequisite[0]
    adjList[u].append(v)
    indegree[v, default: 0] += 1
  }
  // Topologial Sort - using BFS
  var queue = [Int]()
  for course in 0..<numCourses {
    if indegree[course] == nil {
      queue.append(course)
    }
  }
  while !queue.isEmpty {
    let u = queue.removeFirst()
    result.append(u)
    for v in adjList[u] {
      indegree[v]! -= 1
      if indegree[v] == 0 {
        indegree.removeValue(forKey: v)
        queue.append(v)
      }
    }
  }
  if indegree.isEmpty {
    return result
  }
  return []
}
