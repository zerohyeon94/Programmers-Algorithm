import Foundation

func solution(_ board:[[Int]]) -> Int {
    // 입력받은 board의 데이터를 boardData로 옮겨 담는다.
    var boardData: [[Int]] = board
    var safeArea: Int = 0
    // x축과 y축의 count를 확인한다.
    var xCount: Int = boardData[0].count // board의 첫번째 데이터의 갯수 -> [[Int]에서 Int의 수
    var yCount: Int = boardData.count // board의 데이터 갯수 -> [[Int]]에서 [Int]의 수
    print("x: \(xCount), y: \(yCount)")
    
    let require: [Int] = [-1, 0, 1]
    var move: [[Int]] = []
    for i in 0..<require.count {
        for j in 0..<require.count{
            move.append([require[i], require[j]])
        }
    }
    print(move)
    
    for y in 0..<xCount{
        for x in 0..<yCount {
//            print("boardData[\(x)][\(y)] : \(boardData[x][y])")
            if board[x][y] == 1 {
                print("board[\(x)][\(y)] : \(board[x][y])")
                for i in 0..<move.count {
                    if 0 <= x+move[i][0] && x+move[i][0] < yCount && 0 <= y+move[i][1] && y+move[i][1] < xCount {
                        print("\(i): \(move[i][0]),\(move[i][1])")
//                        print("x+move[i][0] : \(x+move[i][0])")
//                        print("y+move[i][1] : \(y+move[i][1])")
//                        print(boardData[x+move[i][0]][y+move[i][1]])
                        boardData[x+move[i][0]][y+move[i][1]] = 1
                    } else {
                        // board의 범위를 벗어난 것들
                    }
                }
            }
        }
    }
    
    for y in boardData{
        for x in y {
            if x == 0 {
                safeArea += 1
            }
        }
    }
    
    print("safeArea: \(safeArea)")
    
    return safeArea
}

solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]])

//solution([[1,2,3], [4,5,6], [7,8,9]])


[1,2,3]
[4,5,6]
[7,8,9]

// Input
[0, 0, 0, 0, 0]
[0, 0, 0, 0, 0]
[0, 0, 0, 0, 0]
[0, 0, 0, 0, 0]
[0, 0, 1, 0, 0]
[0, 0, 0, 0, 0]

// Output
[0, 0, 0, 0, 0]
[0, 0, 0, 0, 0]
[0, 0, 0, 0, 0]
[0, 1, 1, 1, 0]
[0, 1, 1, 1, 0]
[0, 1, 1, 1, 0]

// 다른 사람들의 풀이
func solutionV1(_ board:[[Int]]) -> Int {
    let n = board.count
    var safeArea = Array(repeating: Array(repeating: true, count: n), count: n)

    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]

    for r in (0..<n) {
        for c in (0..<n) {
            if board[r][c] == 1 {
                safeArea[r][c] = false
                for (dr, dc) in dirs {
                    if 0 <= (r + dr) && (r + dr) < n && 0 <= (c + dc) && (c + dc) < n {
                        safeArea[r + dr][c + dc] = false
                    }
                }
            }
        }
    }
    return safeArea.flatMap { $0 }.filter { $0 == true }.count
}

func solutionLee(_ board:[[Int]]) -> Int {
   var newBoard = board
   let width = board.count
    for (rowIndex, row) in newBoard.enumerated() {
        newBoard[rowIndex].insert(0, at: width)
        newBoard[rowIndex].insert(0, at: 0)
        
    }
    let dummyRow = Array(repeating: 0, count: width + 2)
    newBoard.append(dummyRow)
    newBoard.insert(dummyRow, at: 0)
    
    for (rowIndex, row) in newBoard.enumerated() {
        for (itemIndex, item) in row.enumerated() {
            if item == 1 {
                newBoard[rowIndex][itemIndex + 1] = 1
                newBoard[rowIndex][itemIndex - 1] = 1
                newBoard[rowIndex + 1][itemIndex] = 1
                newBoard[rowIndex + 1][itemIndex - 1] = 1
                newBoard[rowIndex + 1][itemIndex + 1] = 1
                newBoard[rowIndex - 1][itemIndex] = 1
                newBoard[rowIndex - 1][itemIndex - 1] = 1
                newBoard[rowIndex - 1][itemIndex + 1] = 1
            }
        }
    }

    newBoard.removeLast()
    newBoard.removeFirst()
    for (rowIndex, row) in newBoard.enumerated() {
        newBoard[rowIndex].removeLast()
        newBoard[rowIndex].removeFirst()
    }
    
    let result = newBoard.flatMap { $0 }.filter { $0 == 0}
                
    let count = result.count
    return count

}
