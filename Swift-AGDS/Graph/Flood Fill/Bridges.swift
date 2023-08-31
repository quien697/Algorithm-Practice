//
//  Bridges.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/9.
//

import Foundation

/// There’s a country made up of several islands. The president of this country promised people that he would build bridges to connect the islands. However, after he got re-elected he started thinking that it would be a waste to build all the bridges. One day he came to the conclusion that he can get away by building only one bridge (shortest). This country can be represented by N x N grid as below (There are 3 islands). Gray square = land, White square = ocean
/// In order to build the shortest bridge
/// Given a `N x N` grid map, write a program to get the length of the shortest bridge.
/// * Input Specification
/// First line: `N (size of the map, 1 <= N <= 100)`
/// Next N lines of data.
/// * Output Specification
/// The shortest length

// Sample Input1
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
// Sample Output1
//3

// Sample Input2
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 1 0 0 1
//0 0 0 0 0 0 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
// Sample Output2
//2

func bridges() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  func solution() {
    let n = Int(readLine()!)!
    var grid = [[Int]]()
    var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var islands = [[Square]](repeating: [], count: 4)
    for _ in 0..<n {
      let row = readLine()!.split(separator: " ").map{ Int($0)! }
      grid.append(row)
    }
    
    var island = 0
    for x in 0..<n {
      for y in 0..<n {
        if grid[x][y] == 1 && check[x][y] == false {
          island += 1
          bfs(x: x, y: y, island: island, n: n, grid: &grid, check: &check, islands: &islands)
        }
      }
    }
    calShortestlength(islands: &islands)
  }
  
  func bfs(x: Int, y: Int, island: Int, n: Int, grid: inout [[Int]], check: inout [[Bool]], islands: inout [[Square]]) {
    let queue = Queue<Square>()
    queue.enqueue(item: Square(x: x, y: y))
    islands[island].append(Square(x: x, y: y))
    check[x][y] = true
    
    while !queue.isEmpty() {
      let square = queue.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if grid[nx][ny] == 1 && check[nx][ny] == false {
            queue.enqueue(item: Square(x: nx, y: ny))
            islands[island].append(Square(x: nx, y: ny))
            check[nx][ny] = true
          }
        }
      }
    }
  }
  
  func calShortestlength(islands: inout [[Square]]) {
    var shortestLength = Int.max
    
    for i in 1..<4 {
      let j = (i+1) == 4 ? 1 : i+1
      for l in islands[i] {
        for r in islands[j] {
          let xLen = (l.x > r.x) ? l.x - r.x : r.x - l.x
          let yLen = (l.y > r.y) ? l.y - r.y : r.y - l.y
          let length = xLen + yLen - 1
          if shortestLength > length {
            shortestLength = length
          }
        }
      }
    }
    print(shortestLength)
  }
  
  solution()
}
