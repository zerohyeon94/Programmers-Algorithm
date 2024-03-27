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

func solution1(_ s:String) -> String {
    var arr = s.components(separatedBy: " ").map({(value:String) -> Int in return Int(value)!})
    
    arr.sort()
    
    return String(arr[0]) + " " + String(arr[arr.count - 1])
}

print(solution1(test1))
print(solution1(test2))
print(solution1(test3))
