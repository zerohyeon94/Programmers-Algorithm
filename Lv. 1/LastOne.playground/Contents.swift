import Foundation

func solution(_ n:Int) -> Int {
    
    for number in 2..<n {
        if n % number == 1 {
            return number
        }
    }
    return 0
}

solution(10)
