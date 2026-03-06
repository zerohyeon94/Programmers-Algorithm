import Foundation

//func solutionOptional(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
//    // Int? 타입 사용: 값이 있으면(Int) 도달 가능, 없으면(nil) 도달 불가능
//    var dp: [Int?] = Array(repeating: nil, count: m)
//    dp[0] = 0
//    
//    for item in info {
//        let traceA = item[0]
//        let traceB = item[1]
//        
//        print("traceA : \(traceA)")
//        print("traceB : \(traceB)")
//        
//        var nextDP: [Int?] = Array(repeating: nil, count: m)
//        
//        for b in 0..<m {
//            print("b: \(b)")
//            // nil이 아닌 경우(유효한 상태)만 옵셔널 바인딩으로 꺼내서 실행
//            print("dp[b] : \(String(describing: dp[b]))")
//            if let currentA = dp[b] {
//                
//                // 1. A가 훔침
//                let nextA = currentA + traceA
//                print("nextA : \(nextA)")
//                if nextA < n {
//                    // 기존 값(nextDP[b])이 nil이거나, 새로운 값이 더 작으면 갱신
//                    if nextDP[b] == nil || nextA < nextDP[b]! {
//                        nextDP[b] = nextA
//                    }
//                }
//                
//                // 2. B가 훔침
//                let nextB = b + traceB
//                print("nextB : \(nextB)")
//                if nextB < m {
//                    if nextDP[nextB] == nil || currentA < nextDP[nextB]! {
//                        nextDP[nextB] = currentA
//                    }
//                }
//                
//                
//            }
//        }
//        
//        
//        print("nextDP: \(nextDP)")
//        
//        dp = nextDP
//    }
//    
//    print("dp : \(dp)")
//    
//    // compactMap으로 nil을 제거하고 남은 숫자 중 최솟값 찾기
//    return dp.compactMap { $0 }.min() ?? -1
//}

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    // a와 b의 관계 - a가 훔치면, b는 훔치지 않는다.
    // a가 훔쳤을 때 b의 값을 가지고 있으면 되겠네.
    // nil인 경우 방법이 없을 때 입력
    // history[b] = a
    var history: [Int?] = Array(repeating: nil, count: m) // 왜 m을 했냐? m이상이면 어차피 경찰에 붙잡힌다.
    
    // 첫번째 둘다 아무것도 훔치지 않았다!
    history[0] = 0
    
    print("history: \(history)")
    
    for i in info {
        let historyA = i[0]
        let historyB = i[1]
        
        var nextDP: [Int?] = Array(repeating: nil, count: m)
        
        // b가 얼마나 훔쳤는지 확인하는 곳 0개부터 최대 m-1까지
        for b in 0..<m {
            print("b : \(b)")
            if let currentA = history[b] {
                print("currentA : \(currentA)")
                let resultA = currentA + historyA // 만약에 A가 훔쳤을 때 값
                print("resultA : \(resultA)")
                if resultA < n {
                    if nextDP[b] == nil || resultA < nextDP[b]! { // A가 경찰에 잡히는 것보다 작은 경우, 그리고 기존의 흔적보다 작은지 확인 -> 왜냐하면 가장 흔적이 작은 최솟값을 구하는 거기 때문에
                        nextDP[b] = resultA // A가 훔치는 걸로 하자
                        
                    }
                }
                
                let resultB = b + historyB
                print("resultB : \(resultB)")
                if resultB < m {
                    if nextDP[resultB] == nil || currentA < nextDP[resultB]! {
                        nextDP[resultB] = currentA
                    }
                }
            }
            
            print("history: \(history)")
        }
        
        history = nextDP
    }
    
    return history.compactMap { num in
        num
    }.min()!
}

let result1 = solution([[1, 2], [2, 3], [2, 1]], 4, 4)
print("result1 : \(result1)")
