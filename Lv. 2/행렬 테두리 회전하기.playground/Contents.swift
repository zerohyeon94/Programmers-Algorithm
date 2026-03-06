import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    // 초기 설정
    var matrix = [[Int]]()
    var num = 1
    
    for _ in 0..<rows {
        var row = [Int]()
        for _ in 0..<columns {
            row.append(num)
            num += 1
        }
        matrix.append(row)
    }
    
    // 최솟값을 넣기 위한 배열
    var result: [Int] = []
    
    // 회전 동작
    for query in queries {
        // 좌표는 0행 0열이 없으니까 index에 맞추기 위해서 -1로 해야함
        let x1 = query[0] - 1
        let y1 = query[1] - 1
        let x2 = query[2] - 1
        let y2 = query[3] - 1
        
        let start = matrix[x1][y1] // 시작점
        var minValue = start // 회전 중에서 가장 작은 숫자를 찾는 거니까 계속 최솟값을 찾아서 넣어야함
        
        // 시작점을 비우니까 시작점의 위치는 밑에서 위로 올라와야하니까
        // 왼쪽부분에서 밑에서 위로 올라오는 방향
        for x in x1..<x2 {
            matrix[x][y1] = matrix[x+1][y1]
            if matrix[x][y1] < minValue {
                minValue = matrix[x][y1]
            }
        }
        
        // 왼쪽 맨아래가 비었으니까
        // 아래에서 오른쪽에서 왼쪽으로 이동
        for y in y1..<y2 {
            matrix[x2][y] = matrix[x2][y+1]
            if matrix[x2][y] < minValue {
                minValue = matrix[x2][y]
            }
        }
        
        // 오른쪽 맨아래가 비었으니까
        // 오른쪽부분에서 위에서 아래로 이동
        for x in stride(from: x2, to: x1, by: -1) {
            matrix[x][y2] = matrix[x-1][y2]
            if matrix[x][y2] < minValue {
                minValue = matrix[x][y2]
            }
        }
        
        // 오른쪽 위에가 비었으니까
        // 위에서 왼쪽에서 오쪽으로 이동
        for y in stride(from: y2, to: y1, by: -1) {
            matrix[x1][y] = matrix[x1][y-1]
            if matrix[x1][y] < minValue {
                minValue = matrix[x1][y]
            }
        }
        
        // 보너스로 시작부분도 오른쪽으로 한칸 이동한곳에 넣어야하니까
        matrix[x1][y1+1] = start
        
        // 최소값을 넣어줘라
        result.append(minValue)
    }
    
    return result
}

print("============")
print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
