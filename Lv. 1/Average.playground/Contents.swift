import Foundation

func solution(_ arr:[Int]) -> Double {
    var result: Double = 0.0
    
    let sum: Double = Double(arr.reduce(0, +))
    let count: Double = Double(arr.count)
    
    result = sum / count
    
    return result
}

let arr1 = [1,2,3,4]

solution(arr1)

let arr2 = [5,5]

solution(arr2)
