import Foundation

let graph: [String: [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D", "E"],
    "C" : ["A", "F"],
    "D" : ["B"],
    "E" : ["B"],
    "F" : ["C"],
]


func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    print("DFS 초기 상태")
    print("방문한 노드: \(visitedQueue)")
    print("방문해야할 노드: \(needVisitStack)")
    
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()
        if visitedQueue.contains(node) {
            print()
            print("방문한 노드: \(visitedQueue)")
            print("방문해야할 노드: \(needVisitStack)")
            continue
        }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
        print()
        print("방문한 노드: \(visitedQueue)")
        print("방문해야할 노드: \(needVisitStack)")
    }
    
    return visitedQueue
}


func BFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]
    print("BFS 초기 상태")
    print("방문한 노드: \(visitedQueue)")
    print("방문해야할 노드: \(needVisitQueue)")
    
    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) {
            print()
            print("방문한 노드: \(visitedQueue)")
            print("방문해야할 노드: \(needVisitQueue)")
            continue
        }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
        print()
        print("방문한 노드: \(visitedQueue)")
        print("방문해야할 노드: \(needVisitQueue)")
    }
    
    return visitedQueue
}


DFS(graph: graph, start: "A")
BFS(graph: graph, start: "A")
