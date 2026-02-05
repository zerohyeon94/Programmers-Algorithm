import Foundation

func solution(_ phone_number:String) -> String {
    let phoneNumber = phone_number.reversed()
    let count = 4
    var result = ""
    
    for (index, text) in phoneNumber.enumerated() {
        if index < count {
            result.append(text)
        } else {
            result.append("*")
        }
    }
    
    result = String(result.reversed())
    print("result : \(result)")
    
    return result
}

let test1 = "01033334444"
let test2 = "027778888"

solution(test1)
solution(test2)

/// 첫번째 개선 방법
/// rverse를 두번이나 처리하는 것은 비효율적이다
/// suffix나 String(repeating:)을 사용하는 것이 좋다

func solution2(_ phone_number:String) -> String {
    // 1. '*'을 (전체 길이 - 4)만큼 반복해서 만듭니다.
    let stars = String(repeating: "*", count: phone_number.count - 4)
    
    // 2. 뒤에서 4자리를 가져옵니다. (Suffix)
    let lastFour = phone_number.suffix(4)
    
    // 3. 두 문자열을 합칩니다.
    return stars + lastFour
}

print("==== 개선 후 결과 ====")
print("test1 \(solution2(test1))")
print("test1 \(solution2(test2))")


/// 두번째 개선 방법
/// map, enumerated 사용하여 함수형 프로그래밍
func solution3(_ phone_number:String) -> String {
    let result = phone_number.enumerated().map { (index, char) -> Character in
        // 인덱스가 (전체 길이 - 4)보다 작으면 '*' 반환, 아니면 원래 문자 반환
        if index < phone_number.count - 4 {
            return "*"
        } else {
            return char
        }
    }
    
    // 문자 배열([Character])을 다시 String으로 변환
    return String(result)
}

print("==== 개선 후 결과 ====")
print("test1 \(solution3(test1))")
print("test1 \(solution3(test2))")
