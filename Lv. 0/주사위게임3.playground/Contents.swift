/**
 Lv 0. 주사위 게임 3

 문제:

 주사위 네 개 값 a, b, c, d가 주어질 때,
 나온 숫자의 패턴에 따라 점수를 계산해서 반환.

 점수 규칙 요약:
 - 네 개가 모두 같을 때 (p, p, p, p)
    → 1111 * p
 - 세 개가 같고, 하나가 다를 때 (p, p, p, q / q는 p와 다름)
    → (10 * p + q)^2
 - 두 개씩 같은 값이 나올 때 (p, p, q, q / p != q)
    → (p + q) * |p - q|
 - 두 개만 같고 나머지 둘은 서로 다른 값일 때 (p, p, q, r / q, r은 p와 다르고 q != r)
    → q * r
 - 네 개가 모두 다를 때
    → 나온 숫자 중 가장 작은 값

 생각할 포인트:
 1. 핵심은 “각 숫자가 몇 번 나왔는지(빈도)”를 세는 것.
    - 예: [2, 2, 2, 5] → 2는 3번, 5는 1번
 2. 빈도에 따라 케이스 분기:
    - 한 가지 숫자만 있다 → case 1 (4개 같음)
    - 두 가지 숫자만 있다
        - 한 숫자 3번, 다른 숫자 1번 → case 2
        - 두 숫자 2번씩 → case 3
    - 세 가지 숫자가 있다 → 반드시 (2, 1, 1) 패턴 → case 4
    - 네 가지 숫자가 있다 → 모두 다름 → case 5
 3. Swift 구현 아이디어:
    - [a, b, c, d] 배열로 만든 뒤
    - [Int: Int] 딕셔너리로 각 숫자의 등장 횟수(count) 세기
        - var freq: [Int: Int] = [:]
        - for x in [a, b, c, d] { freq[x, default: 0] += 1 }
    - freq.count (서로 다른 숫자 개수)와 각 value(횟수)를 보고 분기
 4. 연산 자체는 모두 상수 시간 → 시간 복잡도: O(1)
 5. 제곱은 pow(Double)가 아니라 Int 연산으로 (x * x)로 처리하는 게 편함.
 */

import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    let nums = [a, b, c, d].sorted()
    let x = nums[0]
    let y = nums[1]
    let z = nums[2]
    let w = nums[3]

    // 1) All equal: xxxx
    if x == w { return 1111 * x }

    // 2) Three of a kind + one: xxxy or yxxx
    if x == z { // xxxy
        let p = x, q = w
        let val = 10 * p + q
        return val * val
    }
    if y == w { // yxxx
        let p = w, q = x
        let val = 10 * p + q
        return val * val
    }

    // 3) Two pairs: xxyy
    if x == y && z == w {
        return (x + z) * abs(x - z)
    }

    // 4) One pair and two singles: xxyz, where x is pair and y != z != x
    if x == y { return z * w }
    if y == z { return x * w }
    if z == w { return x * y }

    // 5) All distinct: return smallest
    return x
}

solution(2, 2, 2, 2) // 2222
solution(4, 1, 4, 4) // 1681
solution(6, 3, 3, 6) // 27
solution(2, 5, 2, 6) // 30
solution(6, 4, 2, 5) // 2
