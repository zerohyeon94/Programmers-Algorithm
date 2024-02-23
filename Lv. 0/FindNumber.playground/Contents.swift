import Foundation
import UIKit

func solution(_ num:Int, _ k:Int) -> Int {
    let numString: String = String(num)
    var result: Int = 0

    if numString.contains(String(k)) {
        for (index, number) in numString.enumerated() {
            if String(number) == String(k) {
                result = index + 1
                break
            }
        }
    } else {
        result = -1
    }
    
    print("result : \(result)")
    
    return result
}

solution(291183, 1)

func solutionV1(_ num: Int, _ k: Int) -> Int { Array("-\(num)").firstIndex(of: Character(String(k))) ?? -1 }

func solutionV2(_ num:Int, _ k:Int) -> Int {
    for (index, c) in String(num).enumerated() {
        if String(c) == String(k) {
            return index+1
        }
    }
    return -1
}
