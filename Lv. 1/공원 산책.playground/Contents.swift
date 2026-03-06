import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let H = park.count
    let W = park[0].count
    
    // 공원 격자 생성
    var grid: [[Character]] = []
    var currentR = 0
    var currentC = 0
    
    for (r, rowString) in park.enumerated() {
        print("rowString : \(rowString)")
        let rowChar = Array(rowString)
        print("rowChar : \(rowChar)")
        grid.append(rowChar)
        
        print("grid : \(grid)")
        
        if let c = rowChar.firstIndex(of: "S") {
            currentR = r
            currentC = c
            
            print("시작 지점 : \(currentR), \(currentC)")
        }
    }
    
    // 방향에 따라 이동하는 것 정의
    let directions: [String: (Int, Int)] = [
        "N": (-1, 0),
        "S": (1, 0),
        "W": (0, -1),
        "E": (0, 1)
    ]
    
    for route in routes {
        let parts = route.split(separator: " ")
        print("parts : \(parts)")
        let direction = String(parts[0])
        let distance = Int(parts[1])!
        
        let (dr, dc) = directions[direction]! // 해당 방향의 이동량
        print("dr : \(dr)")
        print("dc : \(dc)")
        
        var newR = currentR
        var newC = currentC
        var isSuccess: Bool = true
        
        for _ in 0..<distance {
            newR += dr
            newC += dc
            
            // 일단 지정된 범위가 벗어나는지 아닌지 확인
            if newR >= 0 && newR < H && newC >= 0 && newC < W {
                print("범위는 안 벗어남")
                
                // 만약에 이동하려고 하는 곳이 장애물인 경우?
                if grid[newR][newC] == "X" {
                    print("장애물이면 못넘어가지, 이동 불가능")
                    isSuccess = false
                    break // 어차피 못가니까 중단
                } else {
                    print("장애물이 아니면 넘어갈 수 있음!")
                    print("이동 : \(currentR), \(currentC)")
                }
            } else {
                print("이동 불가능")
                isSuccess = false
                break // 어차피 못가니까 중단
            }
        }
        
        if isSuccess {
            currentR = newR
            currentC = newC
        }
        
        print("이동 결과 : \(currentR), \(currentC)")
    }
    
    return [currentR, currentC]
}

//print("test : \(solution(["SOO","OOO","OOO"], ["E 2","S 2","W 1"]))")
//print("test : \(solution(["SOO","OXX","OOO"], ["E 2","S 2","W 1"]))")
print("test : \(solution(["OSO","OOO","OXO","OOO"], ["E 2","S 3","W 1"]))")

