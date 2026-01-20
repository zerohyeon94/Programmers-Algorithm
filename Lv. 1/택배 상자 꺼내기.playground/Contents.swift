import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    
    // 1. 내가 찾는 상자(num)의 위치 구하기
    let targetRow = (num - 1) / w
    let targetCol: Int
    
    if targetRow % 2 == 0 { // 짝수 층: 왼쪽 -> 오른쪽 (0, 1, 2...)
        targetCol = (num - 1) % w
    } else {                // 홀수 층: 오른쪽 -> 왼쪽 (w-1, w-2...)
        targetCol = (w - 1) - ((num - 1) % w)
    }
    
    print("targetRow: \(targetRow), targetCol: \(targetCol)")
    
    // 2. 가장 마지막 상자(n)의 위치 구하기
    // 이 부분이 핵심입니다. 마지막 상자가 어디서 끝나는지 알아야 합니다.
    let maxRow = (n - 1) / w
    let maxCol: Int
    
    if maxRow % 2 == 0 {    // 마지막 층이 짝수면
        maxCol = (n - 1) % w
    } else {                // 마지막 층이 홀수면
        maxCol = (w - 1) - ((n - 1) % w)
    }
    
    print("maxRow: \(maxRow), maxCol: \(maxCol)")
    
    // 3. 개수 계산하기
    // 우선, 내 층부터 꼭대기 층까지 "모두 상자가 있다"고 가정합니다.
    var answer = maxRow - targetRow + 1
    
    // 4. 꼭대기 층(maxRow) 검증
    // 마지막 층에 상자가 채워지는 방향을 고려하여, 내 위치(targetCol)까지 상자가 왔는지 확인합니다.
    
    if maxRow % 2 == 0 {
        // 짝수 층(왼 -> 오): 마지막 상자(maxCol)가 내 위치(targetCol)보다 뒤에 있거나 같아야 내 위에 상자가 있음
        // 만약 내 위치가 더 크다면, 마지막 상자는 내 앞에 멈춘 것이므로 내 위는 비어있음.
        if targetCol > maxCol {
            answer -= 1
        }
    } else {
        // 홀수 층(오 -> 왼): 마지막 상자(maxCol)가 내 위치(targetCol)보다 앞에 있거나 같아야 함 (인덱스가 작아야 함)
        // 만약 내 위치가 더 작다면(왼쪽이라면), 상자는 오른쪽에서 오다가 내 전에 멈춘 것임.
        if targetCol < maxCol {
            answer -= 1
        }
    }
    
    return answer
}

solution(13, 3, 6)
