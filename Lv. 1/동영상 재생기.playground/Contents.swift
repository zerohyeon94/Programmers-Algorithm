import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    func mToSec(_ time: String) -> Int {
        let parts = time.split(separator: ":").map {
            Int($0)!
        }
        
        return parts[0] * 60 + parts[1]
    }
    
    func secToM(_ time: Int) -> String {
        let min = time / 60
        let sec = time % 60
        
        return String(format: "%02d:%02d", min, sec)
    }
    
    var posSec = mToSec(pos)
    var opStartSec = mToSec(op_start)
    var opEndSec = mToSec(op_end)
    var videoLenSec = mToSec(video_len)
    
    var currentTime: Int = posSec
    
    // 오프닝 사이에 있는지 확인
    if currentTime >= opStartSec && currentTime <= opEndSec {
        currentTime = opEndSec
    }
    
    for command in commands {
        if command == "prev" {
            currentTime -= 10
            if currentTime < 0 {
                currentTime = 0
            }
        } else {
            currentTime += 10
            if currentTime > videoLenSec {
                currentTime = videoLenSec
            }
        }
        
        if currentTime >= opStartSec && currentTime <= opEndSec {
            currentTime = opEndSec
        }
    }
    
    return secToM(currentTime)
}

print("test 1 : \(solution("10:55", "00:05", "00:15", "06:55", ["prev", "next", "next"]))")


// MARK: - 열거형 형태로 구현해놓는 것
func solutionEnum(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    
    // 1. 명령어 처리를 위한 열거형 선언
    enum Command: String {
        case prev = "prev"
        case next = "next"
    }
    
    // 시간 변환 함수 (기존 로직 유지)
    func mToSec(_ time: String) -> Int {
        let parts = time.split(separator: ":").map { Int($0)! }
        return parts[0] * 60 + parts[1]
    }
    
    func secToM(_ time: Int) -> String {
        let min = time / 60
        let sec = time % 60
        return String(format: "%02d:%02d", min, sec)
    }
    
    // 변수 초기화
    let endPoint = mToSec(video_len)
    var currentTime = mToSec(pos)
    let opStart = mToSec(op_start)
    let opEnd = mToSec(op_end)
    
    // 오프닝 건너뛰기 함수 (반복되는 로직을 함수로 분리)
    func skipOpening() {
        if currentTime >= opStart && currentTime <= opEnd {
            currentTime = opEnd
        }
    }
    
    // 초기 위치 오프닝 체크
    skipOpening()
    
    // 2. Enum을 활용한 명령어 처리
    for commandStr in commands {
        // 문자열을 Enum으로 변환 (옵셔널 바인딩)
        if let command = Command(rawValue: commandStr) {
            switch command {
            case .prev:
                currentTime -= 10
                if currentTime < 0 { currentTime = 0 }
                
            case .next:
                currentTime += 10
                if currentTime > endPoint { currentTime = endPoint }
            }
            
            // 이동 후 오프닝 체크
            skipOpening()
        }
    }
    
    return secToM(currentTime)
}
