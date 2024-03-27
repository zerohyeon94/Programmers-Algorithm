import Foundation

func solution(_ s:String) -> String {
    var result: String = ""
    var number = s.split(separator: " ").map { Int($0)! }
    var max = number.max()!
    var min = number.min()!
    
    result = "\(min) \(max)"
    
    return result
}

let test1 = "1 2 3 4"
let test2 = "-1 -2 -3 -4"
let test3 = "-1 -1"

print(solution(test1))
print(solution(test2))
print(solution(test3))
