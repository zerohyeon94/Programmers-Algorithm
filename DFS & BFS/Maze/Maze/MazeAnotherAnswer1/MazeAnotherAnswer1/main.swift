//
//  main.swift
//  MazeAnotherAnswer1
//
//  Created by 조영현 on 3/20/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var graph: [[Character]] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<n {
    graph.append(readLine()!.map { $0 })
}

func isValidCoord(y: Int, x: Int) -> Bool {
    return 0..<n ~= y && 0..<m ~= x
}

func bfs(y: Int, x: Int) {
    var queue = [(y, x, 1)]
    var index = 0
    visited[y][x] = true
    
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        let d = queue[index].2
        
        if y == n - 1 && x == m - 1 {
            print(d)
            break
        }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if isValidCoord(y: ny, x: nx) && graph[ny][nx] == "1" && !visited[ny][nx] {
                visited[ny][nx] = true
                queue.append((ny, nx, d + 1))
            }
        }
        print(queue)
        index += 1
    }
}

bfs(y: 0, x: 0)
