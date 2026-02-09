func solution(_ seoul:[String]) -> String {
    
    var result: Int = 0
    
    for (index, name) in seoul.enumerated() {
        if name == "Kim" {
            result = index
            
            break
        }
    }
    
    return "김서방은 \(result)에 있다"
}

let test = ["Jane", "Kim"]
print("solution(test) : \(solution(test))")

func solution1(_ seoul:[String]) -> String {
    // 1. "Kim"이 있는 인덱스를 찾습니다.
    // 문제 조건에서 "Kim"은 반드시 있다고 했으므로 강제 언래핑(!)을 해도 안전합니다.
    if let index = seoul.firstIndex(of: "Kim") {
        return "김서방은 \(index)에 있다"
    }
    
    return "" // 실행될 일 없음
}

func solution2(_ seoul:[String]) -> String {
    // "Kim"은 무조건 있으므로 !를 사용하여 바로 값을 꺼냅니다.
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}
