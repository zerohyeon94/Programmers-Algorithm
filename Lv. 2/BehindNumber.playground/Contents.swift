import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    var left: Int = 0
    var right: Int = left + 1
    
    while left < numbers.count {
        print("left: \(left), right: \(right)")
        print("numbers[left]: \(numbers[left]), numbers[right]: \(numbers[right])")
        if numbers[left] < numbers[right] {
            result.append(numbers[right])
            left += 1
            right = left + 1
            
            if left == numbers.count - 1{
                result.append(-1)
                break
            }
        } else {
            right += 1
            print("right: \(right), numbers.count: \(numbers.count)")
            print("right == numbers.count: \(right == numbers.count)")
            if right == numbers.count {
                result.append(-1)
                left += 1
                right = left + 1
                print("left: \(left), numbers.count: \(numbers.count)")
                print("left == numbers.count: \(left == numbers.count-1)")
                if left == numbers.count-1 {
                    print("left == numbers.count 만족")
                    result.append(-1)
                    break
                }
            }
        }
        print("result: \(result)")
    }
    
    print("result: \(result)")
    
    return []
}

let test1 = [2, 3, 3, 5]
let test2 = [9, 1, 5, 3, 6, 2]

//solution(test1)

solution(test2)
