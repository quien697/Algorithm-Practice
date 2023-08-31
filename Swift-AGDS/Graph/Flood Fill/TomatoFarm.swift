//
//  Tomato Farm.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/4/7.
//

import Foundation

/// Tom has a large tomato farm back in Vietnam. His tomatoes are placed in a box as shown in the picture below.
/// Some of the tomatoes stored in his warehouse are ripe, but some may still be green(unripe). Each day, unripe tomatoes adjacent to ripe tomatoes ripen under the influence of ripe tomatoes. (adjacent = left, right, front, back)
/// Tom wants to know if the tomatoes stored in the warehouse are ready to be cooked in a few days.
/// Given the size of the grid-shaped boxes and the information about ripe tomatoes and unripe tomatoes, write a program to calculate how many days it takes for all the tomatoes to ripen.
/// * Input Specification
/// First line: M N (`M: width`, `N: height where 2 <= M, N <= 1000`)
/// Next N lines: 0s and 1s where 0(unripe tomatoes), 1(ripe tomatoes), -1(no tomatoes)
/// * Output Specification*
/// The minimum days. (O if already ripe, -1 if there’s no way to get all ripe tomatoes)

// Sample Input1
//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
// Sample Output1
//8

// Sample Input2
//6 4
//0 -1 0 0 0 0
//-1 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
// Sample Output2
//-1

// Sample Input3
//6 4
//1 -1 0 0 0 0
//0 -1 0 0 0 0
//0 0 0 0 -1 0
//0 0 0 0 -1 1
// Sample Output3
//6

// Sample Input4
//5 5
//-1 1 0 0 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 0 0 0 0
// Sample Output4
//14

// Sample Input5
//2 2
//1 -1
//-1 1
// Sample Output5
//0

func tomatoFarm() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  func solution() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let M = firstLine[0]
    let N = firstLine[1]
    
    var grid = [[Int]]()
    var tomatoes = [Square]()
    
    for i in 0..<N {
      let row = readLine()!.split(separator: " ").map{ Int($0)! }
      grid.append(row)
      for j in 0..<M {
        if row[j] == 1 {
          tomatoes.append(Square(x: i, y: j))
        }
      }
    }

    var check = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    bfs(tomatoes: tomatoes, grid: &grid, check: &check, M: M, N: N)
    calRipedDays(grid: &grid)
  }
  
  func bfs(tomatoes: [Square], grid: inout [[Int]], check: inout [[Bool]], M: Int, N: Int) {
    let queue = Queue<Square>()
    for i in 0..<tomatoes.count {
      let tomato = tomatoes[i]
      queue.enqueue(item: tomato)
      check[tomato.x][tomato.y] = true
    }
    
    while !queue.isEmpty() {
      let square = queue.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < N && ny >= 0 && ny < M {
          if check[nx][ny] == false && grid[nx][ny] != -1 {
            queue.enqueue(item: Square(x: nx, y: ny))
            check[nx][ny] = true
            grid[nx][ny] = grid[x][y] + 1
          }
        }
      }
    }
  }
  
  func calRipedDays(grid: inout [[Int]]) {
    var days = 0
    for i in 0..<grid.count {
      for j in grid[i] {
        if j == 0 {
          print(-1)
          return
        }
        if j > days { days = j }
      }
    }
    print(days - 1)
  }
  
  solution()
}
