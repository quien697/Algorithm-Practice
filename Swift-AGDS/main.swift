//
//  main.swift
//  Swift-AGDS
//
//  Created by Quien on 2023/3/10.
//

import Foundation

// MARK: - Exhaustive Search -> permutation

//var perms = Set<String>()
//permutationUnique("park", "", &perms) // &: "memory address of"
//print(perms)


// MARK: - Exhaustive Search -> combinations

//combinations("google", 3)

//let a = "google"
//print(a[3,3])

//var combs = Set<String>()
//combinations("google", 3, "", &combs) // &: "memory address of"
//print(combs)


// MARK: - Backtracking

//rollDice(2)
//rollDiceSum(2, 5)
//print(rollDiceSumCount)
//rollDiceSumBetter(2, 5)
//print(rollDiceSumBetterCount)

// MARK: - N Queens

//var board = Board(size: 8)
//solveQueens(board: &board)
//solveQueensWithBackTracking(board: &board)
//print("Possible Count = \(possibleCount)")
//print("Count = \(count)")

// MARK: - Searching

//let arr = [10, 2, 5, 4, 1, 8, 7, 9, 6, 3]
//print(linearSearch(arr, 5)!)
//print(binarySearch(arr, 4)) // error

// MARK: - Sorting

//var arr = [10, 2, 5, 4, 1, 8, 7, 9, 6, 3]
//print(bubbleSort(arr, >)) // error
//print(selectionSort(arr, >))
//print(insertionSort(arr, >))
//print(mergeSort(arr, >))
//quickSort(&arr, 0, arr.count - 1, >)
//print(arr)

// MARK: - String

//let text = "ABABCABCABABABABD"
//let pattern = "ABABD"
//let text = "INAHAYSTACKNEEDLEINA"
//let pattern = "NEEDLE"

//print(bruteForceSubstringSearch(text, pattern))

// MARK: - DataStructures -> Bag

//let bag = Bag<String>()
//bag.add(item: "123")
//bag.add(item: "444")
//bag.add(item: "555")
//
//print(bag)

// MARK: - DataStructures -> Stack

//let stack = Stack<String>()
//stack.push(item: "123")
//stack.push(item: "444")
//stack.push(item: "555")
//
//print(stack)
//print("peek() = \(stack.peek()!)")
//print()
//
//print("pull() = \(stack.pop()!)")
//print(stack)
//print("peek() = \(stack.peek()!)")

// MARK: - DataStructures -> Queue

//let queue = Queue<String>()
//queue.enqueue(item: "123")
//queue.enqueue(item: "444")
//queue.enqueue(item: "555")
//
//print(queue)
//print("peek() = \(queue.peek()!)")
//print()
//
//print("pull() = \(queue.dequeue()!)")
//print(queue)
//print("peek() = \(queue.peek()!)")


// MARK: - Graph

// Example Input1
// n, m (# of vertices, # of edges)
// m edges
//6 8
//1 2
//1 5
//2 3
//2 4
//2 5
//5 4
//4 3
//4 6
// Example Input2
// n, m (# of vertices, # of edges)
// m edges (i j w) w: weight
//6 8
//1 2 2
//1 5 7
//2 3 2
//2 4 3
//2 5 1
//5 4 7
//4 3 1
//4 6 7

//adjacencyMatrixRepresentation()
//adjacencyListRepresentation()
//adjacencyListWeightedRepresentation()
//adjacencyListDFS()
//adjacencyListBFS()

// MARK: - Graph -> Examples -> Connected Components

// Example Input1
//6 5
//1 2
//2 5
//5 1
//3 4
//4 6
// Example Input2
//6 8
//1 2
//2 5
//5 1
//3 4
//4 6
//5 4
//2 4
//2 3

//connectedComponents()

// MARK: - Graph -> Examples -> Bipartite

// Example Input
//2
//3 2
//1 3
//2 3
//4 4
//1 2
//2 3
//3 4
//4 2

//isBipartiteWithDFS()
//isBipartiteWithBFS()

// MARK: - Graph -> Examples -> Cyclic Permutation

// Example Input
//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8

//cyclicPermutation()

// MARK: - Graph -> Examples -> Repeating Sequence

// Example Input
// 57 2

//repeatingSequence()

// MARK: - Tree -> Tree Traversal

//treeTraversal()

// MARK: - Tree -> WhosMyParent

// Example Input1
//7
//1 6
//6 3
//3 5
//4 1
//2 4
//4 7
// Example Input2
//12
//1 2
//1 3
//2 4
//3 5
//3 6
//4 7
//4 8
//5 9
//5 10
//6 11
//6 12

//whosMyParentWithDFS()
//whosMyParentWithBFS()

// MARK: - Tree -> WhosMyParent With In-out Testing file

// Step1: execute the command below to compile main.swift to executable.
//        xcrun -sdk macosx swiftc main.swift -o WhosMyParent
// Step2: execute WhosMyParent to testing
//        ./WhosMyParent ./inputfile.in ./outputfile.out

//func whosMyParentWithTestingFile(input: String) -> String {
//  func dfs(result: inout [Int:Int]) {
//    var stack: [(node: Int, parent: Int?)] = []
//    stack.append((node: 1, parent: nil))
//
//    while !stack.isEmpty {
//      let (node, parent) = stack.removeFirst()
//      result[node] = parent
//      for child in adjList[node] {
//        if child != parent {
//          stack.append((node: child, parent: node))
//        }
//      }
//    }
//  }
//
//  let inputLines = input.components(separatedBy: "\n").filter({ $0 != "" })
//  let n = Int(inputLines[0])!
//  let m = n - 1
//  var adjList = [[Int]](repeating: [], count: n + 1)
//
//  for i in 1...m {
//    let edge = inputLines[i].components(separatedBy: " ").map { Int($0)! }
//    let u = edge[0]
//    let v = edge[1]
//    adjList[u].append(v)
//    adjList[v].append(u)
//  }
//
//  var result = [Int:Int]()
//  dfs(result: &result)
//
//  var resultStr = ""
//  for i in 2...n {
//    resultStr += "\(result[i]!)\n"
//  }
//  return resultStr
//}
//
//let inputFile = CommandLine.arguments[1]
//let outputFile = CommandLine.arguments[2]
//
//let inputString = try String(contentsOfFile: inputFile).trimmingCharacters(in: .whitespacesAndNewlines)
//let OutputString = try String(contentsOfFile: outputFile).trimmingCharacters(in: .whitespacesAndNewlines)
//let outputArray = OutputString.components(separatedBy: "\n").filter{ !$0.isEmpty }
//let output = whosMyParentWithTestingFile(input: inputString).components(separatedBy: "\n").filter{ !$0.isEmpty }
//
//if output == outputArray {
//  print("Test passed.")
//} else {
//  print("Test failed.")
//}

// MARK: - Tree -> Diameter

// Example Input1
//5
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
// Example Input2
//8
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 6 2 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
//6 3 2 7 4 -1
//7 6 4 8 5 -1
//8 7 5 -1

//diameter()

// MARK: - Tree -> LCA (Lowest Common Ancestor)

// Example Input
//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15

//lca()

// MARK: - Tree -> Sushi

// Eample Input 1
//8 2
//5 2
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3

// Eample Input 2
//8 5
//0 6 4 3 7
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3

//shshi()

// MARK: - Tree -> Sushi With Testing in-out Files

// num 1 to 25
//let testingNum = 25
//
//let input = try! String(contentsOfFile: "/Users/quien/Programmer/Project/07.AlgorithmPractice/Swift-AGDS/Swift-AGDS/Tree/Examples/Testing/Sushi/sushi.\(testingNum).in")
//
//let output = try! String(contentsOfFile: "/Users/quien/Programmer/Project/07.AlgorithmPractice/Swift-AGDS/Swift-AGDS/Tree/Examples/Testing/Sushi/sushi.\(testingNum).out")
//
//let startTime = DispatchTime.now()
//
//print("---output---")
//shshi(input: input)
//print("---answer---")
//print(output)
//
//let endTime = DispatchTime.now()
//let timeElapsed = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
//let timeElapsedInSeconds = Double(timeElapsed) / 1_000_000_000
//
//print("Time taken: \(timeElapsedInSeconds) seconds")

// MARK: - Graph -> Flood Fill

// MARK: Graph -> Flood Fill -> Town

//town()

// MARK: Graph -> Flood Fill -> Maze

//maze()

// MARK: Graph -> Flood Fill -> Tomato Farm

//tomatoFarm()

// MARK: Graph -> Flood Fill -> Bridges

//bridges()

// MARK: Graph -> Topological Sort

//topologicalSort()

// MARK: - Greedy

// MARK: Greedy -> Minimum Cost Flow

//minimumCostFlow()

// MARK: Greedy -> Minimum Cost Flow With Testing in-out Files

// num 1 to 50
//let testingNum = "02"
//// 33 36 39 40 44 49 45
//let input = try! String(contentsOfFile: "/Users/quien/Programmer/Project/07.AlgorithmPractice/Swift-AGDS/Swift-AGDSTest/MinimumCostFlow/mcf.\(testingNum).in")
//
//let output = try! String(contentsOfFile: "/Users/quien/Programmer/Project/07.AlgorithmPractice/Swift-AGDS/Swift-AGDSTest/MinimumCostFlow/mcf.\(testingNum).out")
//
//let startTime = DispatchTime.now()
//
//print("---output---")
//minimumCostFlow(input: input)
//print("---answer---")
//print(output)
//
//let endTime = DispatchTime.now()
//let timeElapsed = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
//let timeElapsedInSeconds = Double(timeElapsed) / 1_000_000_000
//
//print("Time taken: \(timeElapsedInSeconds) seconds")



//var a = [0,1,2,3,999]
//
//
//print(a.max { $0 < $1 && $0 != 999 && $1 != 999 })

//floyd()

// MARK: - Dynamic Programming -> Example1

// MARK: Dynamic Programming -> ClimbingStairs

//print(climbStairs(45))
//print(climbStairs2(45))

// MARK: Dynamic Programming -> MakeOne

//print(makeOne(10))

// MARK: Dynamic Programming -> 2 x N Tiles

//print(twoByNTiles(5))

// MARK: Dynamic Programming -> 2 x N Tiles part 2

//print(twoByNTiles2(12))

// MARK: Dynamic Programming -> One two Three

//OneTwoThree()

// MARK: Dynamic Programming -> Pretty Number

//print(prettyNumber(1))

// MARK: Dynamic Programming -> Non-decreasing Digits

//print(nonDecreasingDigits(4))

// MARK: Dynamic Programming -> Longest Increasing Subsequence

//print(lengthOfLIS3([4,10,4,3,8,9]))

// MARK: Dynamic Programming -> Sum Of Square Numbers

//print(SumOfSquareNumbers(18))

// MARK: Dynamic Programming -> Pokemon

//Pokemon()

// MARK: Dynamic Programming -> Decode Ways

//print(numDecodings("266101"))

// MARK: Dynamic Programming -> Maximum Subarray

//print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

// MARK: - Dynamic Programming -> Example 2

//print(canPartition([1, 2, 3, 4]))
//print(canPartition([1, 1, 3, 4, 7]))
//print(canPartition([2, 3, 4, 6]))
//print(canPartitionUpDown([1, 2, 3, 4]))
//print(canPartitionUpDown([1, 1, 3, 4, 7]))
//print(canPartitionUpDown([2, 3, 4, 6]))
//print(canPartitionBottomUp([1, 2, 3, 4]))
//print(canPartitionBottomUp([1, 1, 3, 4, 7]))
//print(canPartitionBottomUp([2, 3, 4, 6]))


// MARK: - Dynamic Programming -> Example 3


// MARK: - Dynamic Programming -> Example 4 -> Longest Common Substring

//print(LCSubstringUpDown(s1: "abdca", s2: "cbda"))
//print(LCSubstringUpDown(s1: "passport", s2: "ppsspt"))
//print(LCSubstringBottomUp(s1: "abdca", s2: "cbda"))
//print(LCSubstringBottomUp(s1: "passport", s2: "ppsspt"))
