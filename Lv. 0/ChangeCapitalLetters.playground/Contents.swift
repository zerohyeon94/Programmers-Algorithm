/**
 Lv 0. 대문자로 바꾸기
 
 생각할 포인트:
 1. 문자열 전체를 한 번씩만 보면 된다 → 시간 복잡도: O(n)
 2. 한 글자씩 보면서
    - 소문자면 → 대문자로 바꾸기
    - 대문자면 → 그대로 두기
 3. 언어마다 대소문자 변환용 내장 함수가 거의 항상 있다.
 
 대문자로 변환 : uppercased()
 소문자로 변환 : lowercased()
 첫글자만 대문자로 변환 : capitalized
 */

import Foundation

func solution(_ myString:String) -> String {
    let result = myString.uppercased()
    return result
}

solution("aBcDeFg")
solution("AAA")
