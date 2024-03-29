import Foundation

func solution1(_ edges: [[Int]]) -> [Int] {
    var answer = [0, 0, 0, 0]

    var exchangeCnts = [Int: [Int]]()
    for edge in edges {
        let a = edge[0]
        let b = edge[1]

        if exchangeCnts[a] == nil {
            exchangeCnts[a] = [0, 0]
        }
        if exchangeCnts[b] == nil {
            exchangeCnts[b] = [0, 0]
        }

        // 준 것, 받은 것 카운팅
        // a, b는 a가 b에 준 것, b가 a에게 받은 것
        exchangeCnts[a]![0] += 1
        exchangeCnts[b]![1] += 1
    }

    for (key, exchangeCnt) in exchangeCnts {
        // 그래프는 최소 2개 이상으로 준 것만 2개 이상인 정점이 생성점
        if exchangeCnt[0] >= 2 && exchangeCnt[1] == 0 {
            answer[0] = key
        }
        // 받은 것만 있는 정점의 개수는 막대 그래프의 개수
        else if exchangeCnt[0] == 0 && exchangeCnt[1] > 0 {
            answer[2] += 1
        }
        // 준 것, 받은 것 각각 2개 이상인 점의 개수는 8자 그래프의 개수
        else if exchangeCnt[0] >= 2 && exchangeCnt[1] >= 2 {
            answer[3] += 1
        }
    }

    // 전체 그래프 개수인 생성점의 준 것에서 2종류의 그래프를 빼면 도넛 그래프의 개수
    answer[1] = (exchangeCnts[answer[0]]![0] - answer[2] - answer[3])

    return answer
}

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
    var nodeCount = 0
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
        nodeCount = max(nodeCount, key, value)
    }
    
    print("nodeCount: \(nodeCount)")
    
    // [보낸 횟수, 받은 횟수]
    var exchange = [[Int]](repeating: [0, 0], count: nodeCount + 1)

    for edge in edges {
        let give = edge[0]
        let take = edge[1]
        
        exchange[give][0] += 1
        exchange[take][1] += 1
        print(exchange[give][0])
        print(exchange[take][1])
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
