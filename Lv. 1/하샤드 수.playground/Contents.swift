func solution(_ x:Int) -> Bool {
    var number = x
    var sum = 0
    
    // 숫자가 0보다 클 때까지 반복
    while number > 0 {
        // 1. 10으로 나눈 나머지(%)를 통해 마지막 자릿수를 구해 더함
        sum += number % 10
        
        // 2. 10으로 나누어(/) 마지막 자릿수를 제거함
        number /= 10
    }
    
    // 자릿수의 합(sum)으로 x가 나누어 떨어지는지 확인
    return x % sum == 0
}

let test1 = 10
let test2 = 12
let test3 = 11
let test4 = 13

print("test 1 : \(solution(test1))")
print("test 2 : \(solution(test2))")
print("test 3 : \(solution(test3))")
print("test 4 : \(solution(test4))")

/// Swift 고차함수
/// 숫자를 문자열로 변환한 뒤 각 문자를 다시 숫자로 바꿔서 더하는 방식
func solution2(_ x: Int) -> Bool {
    // 1. String(x): 정수를 문자열로 변환 ("18")
    // 2. .compactMap { $0.wholeNumberValue }: 각 문자를 숫자로 변환 ([1, 8])
    // 3. .reduce(0, +): 배열의 합을 구함 (9)
    let sum = String(x)
        .compactMap { $0.wholeNumberValue }
        .reduce(0, +)
        
    return x % sum == 0
}
