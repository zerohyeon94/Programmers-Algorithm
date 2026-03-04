import Foundation

func solution(_ s:String) -> Int {
    // 예외 처리
    if s.count <= 1 {
        return 1
    }
    
    let chars = Array(s)
    let n = chars.count
    var minLength = n // 초기값 설정 - 압축하지 않는 전체 길이
    
    // 1개 단위부터 n/2개 단위까지 모두 시도 (완전 탐색)
    for step in 1...(n / 2) {
        var compressedString = "" // 압축된 문자
        var prev = String(chars[0..<step])
        print("prev : \(prev)")
        
        var count = 1
        
        // step 크기만큼 증가시키면서 순회
        for i in stride(from: step, to: n, by: step) {
            // 현재 조각 추출 (범위가 배열을 넘어가지 않도록 처리)
            var endIdx = i + step
            if endIdx > n {
                endIdx = n
            }
            
            let current = String(chars[i..<endIdx])
            
            print("current : \(current)")
            print("if \(prev == current)")
            if prev == current {
                // 이전 조각과 같으면 카운트 증가
                count += 1
            } else {
                // 다르다면 이전 조각 기록
                if count > 1 {
                    compressedString += "\(count)\(prev)"
                } else {
                    compressedString += prev
                }
                
                print("compressedString : \(compressedString)")
                
                prev = current
                count = 1
            }
        }
        
        if count > 1 {
            compressedString += "\(count)\(prev)"
        } else {
            compressedString += prev
        }
        
        minLength = min(minLength, compressedString.count)
    }
    
    return minLength
}

let test1 = "aabbaccc"
let test2 = "ababcdcdababcdcd"
let test3 = "abcabcdede"
let test4 = "abcabcabcabcdededededede"
let test5 = "xababcdcdababcdcd"

print(solution(test1))
//print(solution(test2))
//print(solution(test3))
//print(solution(test4))
//print(solution(test5)) 
