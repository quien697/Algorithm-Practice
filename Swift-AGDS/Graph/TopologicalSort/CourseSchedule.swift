//
//  CourseSchedule.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/10.
//

import Foundation

// LeetCode: 207. Course Schedule
// https://leetcode.com/problems/course-schedule/
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  // create a adjList
  var adjList = [[Int]](repeating: [], count: numCourses)
  var indegree = [Int: Int]()
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
    for v in adjList[u] {
      indegree[v]! -= 1
      if indegree[v] == 0 {
        indegree.removeValue(forKey: v)
        queue.append(v)
      }
    }
  }
  if indegree.isEmpty {
    return true
  }
  return false
}

