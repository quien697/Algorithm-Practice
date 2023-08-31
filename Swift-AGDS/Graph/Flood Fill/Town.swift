//
//  Town.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/5.
//

import Foundation

func town() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  func bfs(x: Int, y: Int, color: Int, n: Int) {
    let queue = Queue<Square>()
    queue.enqueue(item: Square(x: x, y: y))
    groupMap[x][y] = color
    result[color] += 1
    
    while !queue.isEmpty() {
      let square = queue.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n { // check the border
          // check if visited, check if there's a house
          if townMap[nx][ny] == 1 && groupMap[nx][ny] == 0 {
            queue.enqueue(item: Square(x: nx, y: ny))
            groupMap[nx][ny] = color
            result[color] += 1
          }
        }
      }
    }
  }
  
  // N : size of the map (5 <= N <= 25)
  let maxN = 25
  var townMap = [[Int]]()
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: maxN), count: maxN)
  var result = [Int](repeating: 0, count: maxN * maxN)
  
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let row = readLine()!.map{ Int(String($0))! }
    townMap.append(row)
  }
  
  var color = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && groupMap[x][y] == 0 {
        color += 1
        bfs(x: x, y: y, color: color, n: n)
      }
    }
  }
  
  print(color)
  result = Array(result[1...color])
  for i in 0..<color {
    print(result[i])
  }
}
