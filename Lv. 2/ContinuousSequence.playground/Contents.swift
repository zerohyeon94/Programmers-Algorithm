import Foundation

/*
 var result: [Int] = []
 var sum: Int = 0
 var sumIndex: [Int] = []
 
 for index in 0..<sequence.count {
 sum = sum + sequence[index]
 sumIndex.append(index)
 
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
 sum -= sequence[sumIndex.first!]
 sumIndex.removeFirst()
 }
 }
 */

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var result: [Int] = []
    // index 값
    var left: Int = 0
    var right: Int = 0
    
    var sum = sequence[left]
    
    while left < sequence.count - 1 {
        print("left: \(left), right: \(right), sum: \(sum)")
        if sum < k {
            if right < sequence.count - 1 {
                right += 1
                sum += sequence[right]
            } else {
                sum -= sequence[left]
                left += 1
            }
        } else if sum > k {
            sum -= sequence[left]
            left += 1
        }
        
        if sum == k {
            print(result.isEmpty)
            if result.isEmpty {
                result = [left, right]
            } else {
                print("check")
                print(result[1] - result[0])
                print(right - left)
                if (result[1] - result[0]) > (right - left) {
                    result = [left, right]
                } else {
                    sum -= sequence[left]
                    left += 1
                }
            }
            
            if right < sequence.count - 1 {
                right += 1
                sum += sequence[right]
            }
            
        }
    }
    
    print("result: \(result)")
    
    return result
}

let sequence1 = [1, 2, 3, 4, 5]
let k1 = 7

let sequence2 = [1, 1, 1, 2, 3, 4, 5]
let k2 = 5

let sequence3 = [2, 2, 2, 2, 2]
let k3 = 6

solution(sequence1, k1)

solution(sequence2, k2)

solution(sequence3, k3)
