//
//  main.swift
//  DfsBfs
//
//  Created by 조영현 on 3/19/24.
//

import Foundation

//let nmv0 = readLine()?.split(separator: " ").map{ Int($0)}
//print(nmv0)

let nmv = readLine()!.split(separator: " ").map{ Int($0)!}
let n = nmv[0] // 노드
let m = nmv[1] // 간선
let v = nmv[2] // 시작 노드
var graph = [[Int]](repeating: [], count: n + 1) // 인접 리스트 나오게 할려고. n + 1을 해준 이유는 정점의 번호는 1번부터이기 때문이다.

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = edge[0]
    let b = edge[1]
    graph[a].append(b)
    graph[b].append(a)
}

var graphAsc = graph.map { $0.sorted() } // 오름차순
var graphDesc = graph.map { $0.sorted(by: >) } // 내림차순

print(graph)
print(graphAsc)
print(graphDesc)

func dfs(_ graph: [[Int]], _ start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitStack: [Int] = [start]
    
    while !needVisitStack.isEmpty {
        let node: Int = needVisitStack.removeLast() // Stack이므로 LIFO
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node]
    }
    
    return visitedQueue
}

func bfs(_ graph: [[Int]], _ start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitQueue: [Int] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: Int = needVisitQueue.removeFirst() // Queue이므로 FIFO
        if visitedQueue.contains(node) {
            continue
        }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node]
    }
    
    return visitedQueue
}

func printResult(dfs: [Int], bfs: [Int]) {
    for i in 0..<dfs.count {
        print(dfs[i], terminator: " ")
    }
    print()
    for i in 0..<bfs.count {
        print(bfs[i], terminator: " ")
    }
}

printResult(dfs: dfs(graphDesc, v), bfs: bfs(graphAsc, v))
