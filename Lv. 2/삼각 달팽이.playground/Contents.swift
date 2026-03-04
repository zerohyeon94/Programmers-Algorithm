import Foundation

func solution(_ n:Int) -> [Int] {
    var triangle = [[Int]]()
    for i in 1...n {
        triangle.append(Array(repeating: 0, count: i))
    }
    
    var x = -1 // 행
    var y = 0 // 열
    var num = 1
    
    for i in 0..<n {
        print("i : \(i)")
        for j in i..<n {
            // 방향 판별
            print("i % 3 : \(i % 3)")
            if i % 3 == 0 {
                // 아래로 이동
                print("아래")
                x += 1
            } else if i % 3 == 1 {
                // 오른쪽으로 이동
                print("오른쪽")
                y += 1
            } else {
                // 대각선 위로 이동
                print("대각선 위로")
                x -= 1
                y -= 1
            }
            
            print("num : \(num)")
            
            // 숫자 채우기
            triangle[x][y] = num
            num += 1
        }
    }
    
    print("triangle : \(triangle)")
    
    return triangle.flatMap { $0 }
}

let test1 = 6
//let test2 = 5
//let test3 = 6

print("solution : \(solution(test1))")
