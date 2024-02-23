import Foundation
import UIKit

func solution(_ s1:[String], _ s2:[String]) -> Int {
    var sameData:Int = 0
    
    for i in 0..<s2.count {
        if s1.contains(s2[i]) {
            sameData += 1
        }
    }
    print("sameData: \(sameData)")
    return sameData
}

solution(["a", "b", "c"], ["com", "b", "d", "p", "c"])

func solutionV1(_ s1:[String], _ s2:[String]) -> Int {
    return Set(s1).intersection(Set(s2)).count
}

func solutionV2(_ s1:[String], _ s2:[String]) -> Int {
    return s1.filter{s2.contains($0)}.count
}
