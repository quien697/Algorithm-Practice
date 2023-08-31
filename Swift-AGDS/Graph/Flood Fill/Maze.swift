//
//  Maze.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/5.
//

import Foundation

func maze() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  var q: [Square] = [Square(x: 0, y: 1)]
  q.insert(Square(x: 0, y: 1), at: 0)
  
  func bfs(x: Int, y: Int) {
    let queue = Queue<Square>()
    queue.enqueue(item: Square(x: x, y: y))
    check[x][y] = true
    
    while !queue.isEmpty() {
      let square = queue.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
         let nx = x + dx[i]
         let ny = y + dy[i]
         if nx >= 0 && nx < m && ny >= 0 && ny < n { // check the border
           if grid[ny][nx] >= 1 && !check[ny][nx] {
             grid[ny][nx] = grid[y][x] + 1
             check[ny][nx] = true
             queue.enqueue(item: Square(x: nx, y: ny))
           }
         }
       }
    }
  }

  let firstLine = readLine()!.split(separator: " ").map{ Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]
  
  var grid = [[Int]]()
  var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
  
  for _ in 0..<n {
    grid.append(readLine()!.map { Int(String($0))! })
  }
  
  bfs(x: 0, y: 0)
  print(grid[n-1][m-1])
}
