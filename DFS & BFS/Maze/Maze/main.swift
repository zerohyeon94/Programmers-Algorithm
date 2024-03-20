//
//  main.swift
//  Maze
//
//  Created by 조영현 on 3/20/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N: Int = input[0]
let M: Int = input[1]
var array = [[Int]](repeating: [], count: N)

for i in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    array[i] = input
}

let udlr = [[0, -1], [0, 1], [-1, 0], [1, 0]] // 상, 하, 좌, 우

// 최소 이동을 확인하기 위해 BFS를 이용한다.
func maze(_ maze: [[Int]]) -> Int {
    var visitedQueue: [[Int]] = []
    var needVisitQueue: [[Int]] = [[0, 0, 1]]
    
    while !needVisitQueue.isEmpty {
        let node = needVisitQueue.removeFirst()
        
        if node[0] == N-1 && node[1] == M-1 {
            return node[2]
        }
        
        if visitedQueue.contains(node) {
            continue
        }
        
        visitedQueue.append(node)
        
        for i in 0..<udlr.count {
            let x = node[1] + udlr[i][0]
            let y = node[0] + udlr[i][1]
            
            if x >= 0 && x < M && y >= 0 && y < N && maze[y][x] == 1 {
                needVisitQueue.append([y, x, node[2] + 1])
            }
        }
    }
    
    return visitedQueue.count
}

let result: Int = maze(array)
print(result)
