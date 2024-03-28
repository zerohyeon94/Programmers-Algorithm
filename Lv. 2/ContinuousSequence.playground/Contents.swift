import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var result: [Int] = []
    var sum: Int = 0
    var sumIndex: [Int] = []
    
    for index in 0..<sequence.count {
        for j in index..<sequence.count {
            sum = sum + sequence[j]
            sumIndex.append(j)
            
            print("index: \(index)")
            print("sum: \(sum)")
            print("sumIndex: \(sumIndex)")
            
            if sum == k {
                if result.isEmpty {
                    result = sumIndex
                } else if result.count > sumIndex.count {
                    result = sumIndex
                }
            } else if sum < k {
                continue
            } else if sum > k {
                sum = 0
                sumIndex = []
                break
            }
        }
    }
    
    return [result.first!, result.last!]
}

let sequence1 = [1, 2, 3, 4, 5]
let k1 = 7

let sequence2 = [1, 1, 1, 2, 3, 4, 5]
let k2 = 5

let sequence3 = [2, 2, 2, 2, 2]
let k3 = 6

print("test1: \(solution(sequence1, k1))")
print("test2: \(solution(sequence2, k2))")
print("test3: \(solution(sequence3, k3))")
