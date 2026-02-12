import Foundation

/// 카드가 2 ~ 100장
/// 카드 수만큼 상자 준비
/// 상자에 1개씩 넣고 무작위로 섞어서 나열
/// 상자가 나열된 순서에 따라 1번부터 증가되는 번호를 상자에 붙임
/// 아무 상자 선택했을 때 선택한 상자의 숫자 카드를 확인한다.
/// 확인한 카드에 적힌 번호에 해당하는 상자를 열어 안에 담긴 카드 숫자를 확인한다.
/// 이미 열려있는 상자가 올때까지 반복한다.
/// 이렇게 연건 1번 그룹
/// 그리고 남은게 없으면 0점.
/// 남은게 있으면 다시 진행해서 22번 그룹
///
/// 예시
/// [8,6,3,7,2,5,1,4]
///

func solution(_ cards:[Int]) -> Int {
    
    var openBoxNumbers: [Int] = []
    var opendBoxCount: [Int] = []
    
    for i in 0..<cards.count {
        // 이미 열린거면 그다음으로 넘어가자!
        if openBoxNumbers.contains(i) {
            continue
        }
        
        var currentBox: Int = i
        var count = 0
        
        while !openBoxNumbers.contains(currentBox) {
            openBoxNumbers.append(currentBox)
            count += 1
            
            currentBox = cards[currentBox] - 1
        }
        
        opendBoxCount.append(count)
    }
    
    if opendBoxCount.count <= 1 {
        return 0
    } else {
        // 내림차순
        opendBoxCount.sort(by: >)
        
        return opendBoxCount[0] * opendBoxCount[1]
    }
}

func solution1(_ cards:[Int]) -> Int {
    // 1. Array 대신 Bool 배열을 미리 만들어둡니다. (메모리를 조금 쓰고 속도를 얻음)
    // visited[0]은 1번 상자가 열렸는지를 나타냄
    var visited = Array(repeating: false, count: cards.count)
    var groupCounts: [Int] = []
    
    for i in 0..<cards.count {
        // contains 대신 visited[i]로 즉시 확인 (속도 O(1))
        if visited[i] {
            continue
        }
        
        var currentBox = i
        var count = 0
        
        // contains 대신 visited[currentBox]로 즉시 확인
        while !visited[currentBox] {
            visited[currentBox] = true // 상자 열림 표시
            count += 1
            
            // 다음 상자로 이동 (값 - 1 = 인덱스)
            currentBox = cards[currentBox] - 1
        }
        
        groupCounts.append(count)
    }
    
    // 이 아래 로직은 작성하신 것과 완벽히 동일합니다.
    if groupCounts.count < 2 {
        return 0
    } else {
        groupCounts.sort(by: >)
        return groupCounts[0] * groupCounts[1]
    }
}

let test = [8,6,3,7,2,5,1,4]
let result = solution(test)
print("result : \(result)")
