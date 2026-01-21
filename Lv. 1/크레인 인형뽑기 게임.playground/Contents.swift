import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var bag = [Int]()
    var boardCopy = board
    var removeDollCount = 0
    
    // move는 1부터 시작
    for move in moves {
        var col = move - 1
        
        // 집게가 row가 0부터 계속 내려간다.
        for row in 0..<boardCopy.count {
            // 0이 아닌 인형 값이 있는 경우
            if boardCopy[row][col] != 0 {
                let doll = boardCopy[row][col]
                boardCopy[row][col] = 0 // 0으로 초기화
                
                // 만약에 마지막 인형이 있다면?
                if let lastDoll = bag.last, lastDoll == doll {
                    bag.removeLast() // 마지막꺼를 지우기만하고, 추가하지는 않는다.
                    removeDollCount += 2 // 직전꺼와 지금꺼를 모두 삭제하니까 +2를 한다.
                } else {
                    bag.append(doll) // 그게 아니라면 그냥 가방에 넣는다.
                }
                
                break // 인형을 집었으니까? 다음 동작으로 넘어간다.
            }
        }
        
        print("bag: \(bag)")
    }
    
    return removeDollCount
}

// MARK: 1차 풀이 후 틀린 것에 대한 답변
func solution1(_ board:[[Int]], _ moves:[Int]) -> Int {
    var bag = [Int]()
    var boardCopy = board
    var removedCount = 0 // 사라진 인형 개수를 셀 변수
    
    // 1. 크레인 이동 (좌우 이동)
    for move in moves {
        let col = move - 1 // 0번 인덱스 기준 열 번호
        
        // 2. 위에서 아래로 내려가며 인형 찾기 (수직 이동)
        for row in 0..<boardCopy.count {
            
            // 0이 아닌 값(인형)을 발견했다면?
            if boardCopy[row][col] != 0 {
                let doll = boardCopy[row][col]
                boardCopy[row][col] = 0 // 인형을 집었으니 빈칸(0)으로 만듦
                
                // 3. 바구니 로직 (Stack)
                // 바구니에 마지막으로 넣은 인형이 지금 뽑은 인형과 같은지 확인
                if let lastDoll = bag.last, lastDoll == doll {
                    // 같다면 터뜨림
                    bag.removeLast() // 바구니에서 마지막 인형 제거
                    removedCount += 2 // 두 개가 사라졌으므로 +2
                } else {
                    // 다르거나 바구니가 비어있다면 쌓기
                    bag.append(doll)
                }
                
                // 인형을 하나 집었으면, 더 이상 내려가지 않고 다음 move로 넘어감 (중요!)
                break
            }
        }
    }
    
    return removedCount
}

// MARK: 이중 반복문으로도 효율적이지만 시간 복잡도 부분에 개선할 여지가 있다.
// moves 배열을 돌면서 매번 내부에서 row를 위에서 바닥까지 확인하다보니까 헛되이 되는 검사를 하게된다.
// 이를 효율적으로 하기위해 스택으로 접근한다.

func solution2(_ board:[[Int]], _ moves:[Int]) -> Int {
    // 1. 보드 뒤집기 (전처리 과정)
    // 각 열(Column)을 스택으로 만듭니다.
    // lanes[0]은 1번 레인의 인형들이 담긴 배열이 됩니다.
    var lanes = [[Int]](repeating: [], count: board.count)
    
    // board를 역순으로(바닥부터) 읽어서 lanes에 채워 넣습니다.
    // 0(빈칸)은 넣지 않습니다.
    for row in (0..<board.count).reversed() {
        for col in 0..<board.count {
            if board[row][col] != 0 {
                lanes[col].append(board[row][col])
            }
        }
    }
    
    print("lanes: \(lanes)")
    
    var bag = [Int]()
    var removeDollCount = 0
    
    // 2. 크레인 작동 (O(1) 접근)
    for move in moves {
        let col = move - 1
        
        // 해당 레인에 인형이 남아있다면 popLast()로 바로 꺼냄 (반복문 없음!)
        if let doll = lanes[col].popLast() {
            print("col:\(col) / doll : \(doll)")
            if let lastDoll = bag.last, lastDoll == doll {
                bag.removeLast()
                removeDollCount += 2
            } else {
                bag.append(doll)
            }
        } else {
            print("col: \(col) 인형이 없음")
        }
        
        print("lanes: \(lanes)")
        print("bag: \(bag)")
        print("-------------------------------------------")
    }
    
    return removeDollCount
}

solution2([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])
