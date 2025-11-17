/**
 Lv 0. n의 배수
 
 문제:
 - 정수 num과 n이 주어졌을 때,
   - num이 n의 배수면 1
   - 아니면 0 을 반환하는 함수 작성
 
 생각할 포인트:
 1. "배수"의 정의 → num이 n으로 나누어떨어진다 = 나머지가 0이다.
    - 수식: num % n == 0
 2. 나머지 연산자 `%` 사용
    - num % n == 0 이면 1
    - 그렇지 않으면 0
 3. 시간 복잡도는 O(1) (단순 연산 1번)
 4. Swift에서는:
    - 매개변수 타입: Int
    - 반환 타입: Int (1 또는 0, Bool이 아님에 주의)

 */

//import Foundation

//func solution(_ num:Int, _ n:Int) -> Int {
//    if num % n == 0 {
//        return 1
//    } else {
//        return 0
//    }
//}

//func solution(_ num:Int, _ n:Int) -> Int {
//    num % n == 0 ? 1 : 0
//}

func solution(_ num: Int, _ n: Int) -> Int {
    num.isMultiple(of: n) ? 1 : 0
}

solution(98, 2)
solution(34, 3)
