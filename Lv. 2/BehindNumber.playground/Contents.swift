import Foundation

// MARK: 시간 초과 Fail
func solutionFail(_ numbers:[Int]) -> [Int] {
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
    
    return result
}

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    var stack = [Int]() // 뒷 큰수를 구하지 못한 index를 넣어놓는 곳
    
    for i in 0..<numbers.count {
        print("i:\(i), numbers[i]: \(numbers[i])")

        // 뒷큰수를 구하지 못한 index를 넣는 stack이 비어있는지 아닌지 확인
        print("while문 조건: \(!stack.isEmpty && numbers[i] >= numbers[stack.last!])")
        while !stack.isEmpty && numbers[i] > numbers[stack.last!] {
            // stack형태로 이미 외부에서 while문의 조건을 만족하지 못하는 경우 stack에 쌓이므로 마지막에 호출된 값이 numbers[i]의 뒷큰수 이다.
            let last = stack.removeLast()
            result[last] = numbers[i]
            print("해당 index(\(last))[값: \(numbers[last])]보다 큰 값을 가진 것을 찾았다. (그것은 index(\(i))[값: \(numbers[i])] result: \(result)")
        }
        
        // 뒷 큰 수가 없기 때문에 지속적으로 쌓는다.
        if stack.isEmpty {
            print("Stack이 비어있어서 해당 index(\(i))[값: \(numbers[i])] 값이 스택에 쌓인다.")
        } else {
            print("해당 index(\(i))[값: \(numbers[i])]보다 뒤에 값이 크지 않아서 스택에 쌓는다.")
        }
        stack.append(i)
    }
    
    return result
}

let test1 = [2, 3, 3, 5]
let test2 = [9, 1, 5, 3, 6, 2]

solution(test1)

//solution(test2)
