func solution(_ n:Int) -> Int {
    var i: Int = 0
    var resultArray: [Int] = []
    
    while i <= n {
        if i == 0 {
            resultArray.append(0)
        } else if i == 1 {
            resultArray.append(1)
        } else {
            let result = (resultArray[i-1] + resultArray[i-2]) % 1234567
            resultArray.append(result)
        }
        
        i += 1
    }
    
    print("resultArray : \(resultArray)")
    
    let result: Int = resultArray[n]
    
    return result
}

let test1 = 3
let test2 = 5

print("solution: \(solution(test1))")
print("solution: \(solution(test2))")


func solution1(_ n: Int) -> Int {
    var a = 0 // F(0)
    var b = 1 // F(1)
    
    // 2부터 n까지 반복합니다.
    for _ in 2...n {
        // 1. 다음 피보나치 수를 계산하고 1234567로 나눈 나머지를 구합니다.
        let next = (a + b) % 1234567
        
        // 2. 값들을 한 칸씩 앞으로 밀어줍니다. (업데이트)
        a = b
        b = next
    }
    
    // n번째 반복이 끝나면 b에 우리가 원하는 값이 들어있습니다.
    return b
}
