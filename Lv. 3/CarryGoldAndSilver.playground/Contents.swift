import Foundation

func solution(_ a: Int, _ b: Int, _ g: [Int], _ s: [Int], _ w: [Int], _ t: [Int]) -> Int64 {
    var left: Int = 0
    var right: Int = 400_000_000_000_000 // 10e15와 유사한 넉넉한 값
    var answer: Int = right
    
    while left <= right {
        let mid = (left + right) / 2
        
        if canDeliver(mid, a, b, g, s, w, t) {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return Int64(answer)
}

func canDeliver(_ time: Int,
                _ a: Int, _ b: Int,
                _ g: [Int], _ s: [Int],
                _ w: [Int], _ t: [Int]) -> Bool {
    
    var totalGold: Int = 0
    var totalSilver: Int = 0
    var totalAll: Int = 0
    
    for i in 0..<g.count {
        let tripTime = t[i]
        
        if time < tripTime { continue }
        
        let roundTrips = time / (2 * tripTime)
        var trips = roundTrips
        
        if time % (2 * tripTime) >= tripTime {
            trips += 1
        }
        
        let maxCarry = trips * w[i]
        
        let cityGold = g[i]
        let citySilver = s[i]
        
        totalGold += min(cityGold, maxCarry)
        totalSilver += min(citySilver, maxCarry)
        totalAll += min(cityGold + citySilver, maxCarry)
    }
    
    if totalGold >= a && totalSilver >= b && totalAll >= a + b {
        return true
    }
    return false
}

let test = solution(10, 10, [100], [100], [7], [10])
print("result : \(test)")

func solution1(_ a: Int, _ b: Int, _ g: [Int], _ s: [Int], _ w: [Int], _ t: [Int]) -> Int64 {
    // Int -> Int64 변환
    let n = g.count
    var gold = [Int64](repeating: 0, count: n)
    var silver = [Int64](repeating: 0, count: n)
    var weight = [Int64](repeating: 0, count: n)
    var time = [Int64](repeating: 0, count: n)
    
    for i in 0..<n {
        gold[i] = Int64(g[i])
        silver[i] = Int64(s[i])
        weight[i] = Int64(w[i])
        time[i] = Int64(t[i])
    }
    
    let needGold = Int64(a)
    let needSilver = Int64(b)
    
    var left: Int64 = 0
    var right: Int64 = 1_000_000_000_000_000
    var answer: Int64 = right
    
    while left <= right {
        let mid = (left + right) / 2
        
        if canDeliver(mid, needGold, needSilver, gold, silver, weight, time) {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return answer
}

func canDeliver(_ time: Int64,
                _ a: Int64, _ b: Int64,
                _ g: [Int64], _ s: [Int64],
                _ w: [Int64], _ t: [Int64]) -> Bool {
    
    var totalGold: Int64 = 0
    var totalSilver: Int64 = 0
    var totalAll: Int64 = 0
    
    for i in 0..<g.count {
        let tripTime = t[i]
        if time < tripTime { continue }  // 편도 한 번도 못 가는 시간이면 스킵
        
        // 왕복 횟수
        let roundTrips = time / (2 * tripTime)
        var trips = roundTrips
        
        // 편도 한 번 더 가능한지
        if time % (2 * tripTime) >= tripTime {
            trips += 1
        }
        
        let maxCarry = trips * w[i]  // 이 도시 트럭이 옮길 수 있는 최대 광물
        
        // 이 도시 전체 보유량
        let cityGold = g[i]
        let citySilver = s[i]
        
        // 실제로 옮길 수 있는 양들
        totalGold += min(cityGold, maxCarry)
        totalSilver += min(citySilver, maxCarry)
        totalAll += min(cityGold + citySilver, maxCarry)
    }
    
    if totalGold >= a && totalSilver >= b && totalAll >= a + b {
        return true
    }
    return false
}

func solution2(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    // 이분 탐색을 위한 범위 설정
    var low: Int64 = 0
    var high: Int64 = 1_000_000_000_000_000
    var answer: Int64 = high
    
    let n = g.count
//    print("n : \(n)")
    
    // 결정 함수: 주어진 time 내에 a, b를 모두 채울 수 있는가?
    func isPossible(_ time: Int64) -> Bool {
        var totalGold: Int64 = 0
        var totalSilver: Int64 = 0
        var totalMix: Int64 = 0
        
//        print("time : \(time)")
        
        for i in 0..<n {
            // i 도시의 정보
            let timePerTrip = Int64(t[i])
            let weightLimit = Int64(w[i])
            let goldInCity = Int64(g[i])
            let silverInCity = Int64(s[i])
            
            // 주어진 시간 동안 몇 번 왕복 가능한지 계산
            // 왕복 시간 = timePerTrip * 2
            let roundTripTime = timePerTrip * 2
            var moveCount = (time / roundTripTime)
            
            // 남은 시간이 편도 시간보다 길면 편도 1회 추가 가능
            if (time % roundTripTime) >= timePerTrip { // 시간에서 왕복시간을 나눴을 때 나머지 시간이 도시까지가는 편도
                moveCount += 1 // 한번 더 갈 수 있으니까 시간 추가
            }
            
            // 이 트럭이 시간 내에 옮길 수 있는 최대 무게
            let maxCapacity = moveCount * weightLimit
            
            // 각 항목별 누적 (도시가 가진 양과 트럭이 옮길 수 있는 양 중 작은 것)
            totalGold += min(goldInCity, maxCapacity)
            totalSilver += min(silverInCity, maxCapacity)
            totalMix += min(goldInCity + silverInCity, maxCapacity)
            
//            print("\(i)번 도시에서 골드는 \(totalGold), 실버 \(totalSilver), 합쳐서 \(totalMix)")
        }
        
        // 조건 확인
        // 1. 금만 최우선으로 날랐을 때 a 이상인가?
        // 2. 은만 최우선으로 날랐을 때 b 이상인가?
        // 3. 금과 은을 적절히 섞어서 총합이 a+b 이상인가?
        if totalGold >= Int64(a) && totalSilver >= Int64(b) && totalMix >= Int64(a + b) {
            return true
        }
        
        return false
    }
    
    // 이분 탐색 수행
    while low <= high {
        let mid = (low + high) / 2
        
        if isPossible(mid) {
            // 가능하면 시간을 더 줄여본다 (최솟값을 찾기 위해)
            answer = min(answer, mid)
            high = mid - 1
        } else {
            // 불가능하면 시간을 늘린다
            low = mid + 1
        }
        
//        print("answer : \(answer), low : \(low), high : \(high)")
    }
    
    return answer
}


//let test1 = solution1(10, 10, [100], [100], [7], [10])
//let test2 = solution2(10, 10, [100], [100], [7], [10])
//print("result1 : \(test1)")
//print("result2 : \(test2)")
