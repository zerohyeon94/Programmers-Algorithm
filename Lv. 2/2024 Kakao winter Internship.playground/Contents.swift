import Foundation

// edges: 그래프의 간선 정보
func solution(_ edges:[[Int]]) -> [Int] {
    print("edges: \(edges)")
    // 1. 도넛 모양 그래프
    // size n -> 정점: n개, 간선: n개
    // 자기 자신에게 돌아오는 모습
    // 2. 막대 모양 그래프
    // size n -> 정점: n개, 간선: n-1 개
    // 계속 다음 정점으로 이동하는 모습
    // 한 정점에서 출발해서 간선을 계속 따라가면 나머지 n-1개의 정점을 한 번씩 방문하는 것이 있는 정점이 하나!
    // 3. 8자 모양 그래프
    // size n -> 정점: 2n+1개, 간선: 2n+2개
    // 본인에게오는 간선 2개, 다른 곳으로 가는 간선 2개
    var node: Set<Int> = []
    // 결과물
    var result: [Int] = []
    var vertex: Int = 0
    var donut: Int = 0
    var bar: Int = 0
    var eight: Int = 0
    
    // 각 node 당 이동하는 정점이 어디인지 파악
    for edge in edges {
        let key = edge[0]
        let value = edge[1]
        node.insert(key)
        node.insert(value)
    }
    
    // [보낸 횟수, 받은 횟수]
    var exchange = [[Int]](repeating: [0, 0], count: node.count + 1)

    for edge in edges {
        let give = edge[0]
        let take = edge[1]
        
        exchange[give][0] += 1
        exchange[take][1] += 1
    }
    
    print("exchange: \(exchange)")
    
    for (index, value) in exchange.enumerated() {
        let give = value[0]
        let take = value[1]
        print("\(give), \(take)")
        // 1. 정점
        if give >= 2 && take == 0{
            vertex = index
        }
        // 2. 막대 그래프의 수
        else if give == 0 && take >= 1 {
            bar += 1
        }
        // 3. 8자 그래프의 수
        else if give >= 2 && take >= 2 {
            eight += 1
        }
    }
    
    donut = exchange[vertex][0] - bar - eight
    
    result = [vertex, donut, bar, eight]
    
    // 각 정점은 서로 다른 번호
    return result
}

let test1 = [[2, 3], [4, 3], [1, 1], [2, 1]]
let test2 = [[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]

print(solution(test1))
print(solution(test2))
