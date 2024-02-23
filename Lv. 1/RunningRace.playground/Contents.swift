import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    // 현재의 순위는 입력받은 players의 순서
    // callings의 count를 생각하고 그 때마다 순위를 변동한다.
    var raceInProgress: [String] = players // race의 과정의 순위
    var raceResult: [String] = [] // race의 결과를 넣기 위한 배열
    
    for i in 0..<callings.count {
        // callings에서 불린 player의 순위를 확인한다.
        if let callingRanking = raceInProgress.firstIndex(of: callings[i]) {
            let changeRank = raceInProgress[callingRanking]
            raceInProgress[callingRanking] = raceInProgress[callingRanking-1]
            raceInProgress[callingRanking-1] = changeRank
        }
    }
    raceResult = raceInProgress
    
    return raceResult
}

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))

let answerKey: [String] = ["mumu", "kai", "mine", "soe", "poe"]
print("답안 : \(answerKey)")

func solutionV1(_ players: [String], _ callings: [String]) -> [String] {
    var rankToName = [Int: String]()
    var nameToRank = [String: Int]()
    
    var raceResult: [String]
    
    // 이름과 랭킹을 같이 기록
    for (index, player) in players.enumerated() {
        rankToName[index+1] = player
        nameToRank[player] = index+1
    }
    
    for caller in callings {
        if let callerRank = nameToRank[caller], let frontName = rankToName[callerRank - 1], callerRank > 1 { // 불려진 사람의 순위, 앞에 사람의 이름
            
            // 불린 사람의 순위는 -1이 되고 (callerRank-1등은 caller)
            rankToName[callerRank - 1] = caller
            nameToRank[caller] = callerRank - 1
            
            // 원래 불린 사람의 앞에 있는 사람은 불린 사람의 순위가 된다. callRank등은  frontName
            rankToName[callerRank] = frontName
            nameToRank[frontName] = callerRank
        }
        
    }
    // 마지막으로 등수 순으로 정렬을 한다.
    raceResult = rankToName.sorted{ $0.key < $1.key }.map{ $0.value}
    
    return raceResult
}


//solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])
//solutionV1(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])

//let answerKey: [String] = ["mumu", "kai", "mine", "soe", "poe"]
//print("답안 : \(answerKey)")

func solutionOh(_ players: [String], _ callings: [String]) -> [String] {
    var rankings = [String: Int]() // 선수 이름과 랭킹 인덱스로 이루어진 딕셔너리(0등부터~)
    var players = players // players 변수 선언

    for (index, player) in players.enumerated() {
        rankings[player] = index
    }
    
    callings.forEach {
        if let i = rankings[$0] {
            
            rankings[$0]! -= 1 // 추월한 선수 랭킹 -1
            rankings[players[i - 1]]! += 1 // 추월당한 선수 랭킹 +1 ⭐️⭐️
            players.swapAt(i - 1, i) // 추월한 선수와 추월당한 선수 위치 교체
        }
    }
    return players
}
