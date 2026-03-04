import Foundation

func solution(_ s:String) -> Bool{
    var ans:Bool = false
    
    // count를 통해 스택으로 구현
    var count = 0
    
    for c in s {
        if c == "(" {
            count += 1 // count에 넣기
        } else if c == ")" {
            count -= 1 // count에서 빼기
        }
        
        if count < 0 { // 빈스택에서 빼기 시도 없기 때문에 false
            ans = false
            break
        }
    }
    
    if count == 0 { // 최종적으로 스택이 비었는지 확인
        ans = true
    }

    return ans
}

let test1 = "()()"
let test2 = "(())()"
let test3 = ")()("
let test4 = "(()("

print("test1 : \(solution(test1))")
print("test2 : \(solution(test2))")
print("test3 : \(solution(test3))")
print("test4 : \(solution(test4))")

/// 만약에 괄호의 종류가 (, {, [ 이렇게 여러개일 경우
func solution2(_ s: String) -> Bool {
    var stack: [Character] = []
    
    // 닫힌 괄호를 키(Key), 열린 괄호를 값(Value)으로 하는 딕셔너리
    let matching: [Character: Character] = [
        ")": "(",
        "}": "{",
        "]": "["
    ]
    
    for char in s {
        // 1. 만약 현재 문자(char)가 딕셔너리의 '키'에 있다면? (즉, 닫힌 괄호라면)
        if let expectedOpen = matching[char] {
            // 스택이 비어있거나, 스택에서 방금 꺼낸 맨 위 괄호가 짝이 안 맞으면 실패
//            if stack.isEmpty || stack.removeLast() != expectedOpen {
            if stack.popLast() != expectedOpen {
                return false
            }
            
        } else {
            // 2. 딕셔너리의 '키'에 없다면 열린 괄호라는 뜻이므로 스택에 넣음 (Push)
            stack.append(char)
        }
    }
    
    // 3. 다 끝났을 때 스택이 비어있어야 완벽하게 짝이 맞은 것
    return stack.isEmpty
}

let solution2test1 = "{[()]}"
let solution2test2 = "([)]"
let solution2test3 = "}()"
let solution2test4 = "{()"

print("test1 : \(solution2(solution2test1))")
print("test2 : \(solution2(solution2test2))")
print("test3 : \(solution2(solution2test3))")
print("test4 : \(solution2(solution2test4))")
