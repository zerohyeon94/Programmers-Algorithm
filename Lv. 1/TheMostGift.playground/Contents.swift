import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var result: Int = 0
    
    // friend를 각각 구분하기 위해 index값으로 지정한다.
    var friendsInfo: [String: Int] = [:]
    for (index, friend) in friends.enumerated() {
        friendsInfo[friend] = index
    }
    
    print(friendsInfo)
    
    // 주고 받은 선물을 표로 만든다.
    // 1. 주고 받은 사람을 표시한 표 Array(repeating: 반복할 값, count: 반복할 횟수)
    var giveGifts: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: friends.count), count: friends.count)
    // 2. 선물 지수를 계산한 표
    var giftCount: [Int] = [Int](repeating: 0, count: friends.count)
    
    print(giveGifts)
    print(giftCount)
    
    // 각 표에 값을 채운다. components, split 비교
    for gift in gifts {
        let giverReceiver = gift.split(separator: " ").map { String($0) }
        print(giverReceiver.first)
        print(giverReceiver.last)
        // 위에서 각 friend마다 index값을 부여했기 때문에, 이를 이용하여 값을 추가한다.
        // friendsInfo의 출력값이 Optional로 표시되기 때문에 이때, Optional binding으로 이를 해결해야한다.
        if let giver = giverReceiver.first, let receiver = giverReceiver.last {
            if let giverIndex = friendsInfo[giver], let receiverIndex = friendsInfo[receiver] {
                // 1. 주고 받은 사람을 표시한다.
                giveGifts[giverIndex][receiverIndex] += 1 // giver의 배열에 receiver의 값을 1 올려준다.
                // 2. 선물 지수를 계산해준다.
                giftCount[giverIndex] += 1 // 선물을 주었기 때문에 giver의 선물 지수는 1 증가
                giftCount[receiverIndex] -= 1 // 선물을 받았기 때문에 receiver의 선물 지수는 1 감소
            }
        }
    }
    
    for giver in 0..<friends.count {
        // 다음달 받을 선물
        var giftToReceive: Int = 0
        
        for receiver in 0..<friends.count where giver != receiver { // where 조건을 주가하여 giver와 receiver는 같을 수 없기 때문에 해당조건을 만족하는 것만 실행시킨다.
            // 선물을 다시 받는 경우
            // 1) giver가 receiver에게 더 많은 선물을 준 경우
            // 또는
            // 2) 주고받은 기록이 없거나(이때 주고받을 경우만 +를 해주었음으로 둘다 0이다) 주고 받은 수가 같은 경우
            //    선물 지수가 큰 사람이 작은 사람에게 선물을 하나 받게 된다. giveCount가 높은 사람인 경우 받게 된다.
            if giveGifts[giver][receiver] > giveGifts[receiver][giver]
                ||
                (giveGifts[giver][receiver] == giveGifts[receiver][giver] && giftCount[giver] > giftCount[receiver]) {
                giftToReceive += 1
            }
        }
        print("\(friends[giver])")
        print("주고받은 현황: \(giveGifts[giver])")
        print("선물지수: \(giftCount[giver])")
        print("다음달의 받을 선물: \(giftToReceive)")
        
        // 최종 값을 비교한다.
        result = max(result, giftToReceive)
    }
    
    return result
}

let friends1 = ["muzi", "ryan", "frodo", "neo"]
let gifts1 = ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]
let friends2 = ["joy", "brad", "alessandro", "conan", "david"]
let gifts2 = ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]
let friends3 = ["a", "b", "c"]
let gifts3 = ["a b", "b a", "c a", "a c", "a c", "c a"]

let result1 = solution(friends1, gifts1)
//let result2 = solution(friends2, gifts2)
//let result3 = solution(friends3, gifts3)

print(result1)
//print(result2)
//print(result3)

/*
func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var friendsGive: [String: Int] = [:]
    var friendsReceive: [String: Int] = [:]
    var giftCount: [String: Int] = [:]
    var moreGiver: [String: Int] = [:]
    var result: Int = 0
    
    for gift in gifts {
        let giverReceiver = gift.split(separator: " ").map { String($0) }
        //        print(giverReceiver)
        if let giver = giverReceiver.first, friends.contains(giver) {
            friendsGive[giver, default: 0] += 1 // dictionary의 경우 Subscript로 요소에 접근하면 기본 반환값이 Optional Type이기 때문에(Key 값이 없을 때를 대비) default값을 직접 명시하면됨.
        }
        
        if let receiver = giverReceiver.last, friends.contains(receiver) {
            friendsReceive[receiver, default: 0] += 1
        }
    }
    
        print(friendsGive)
        print(friendsReceive)
    
    for friend in friends {
        var giveCount: Int = 0
        var receiveCount: Int = 0
        
        if let count = friendsGive[friend] {
            giveCount = count
        } else {
            giveCount = 0
        }
        
        if let count = friendsReceive[friend] {
            receiveCount = count
        } else {
            receiveCount = 0
        }
        
        giftCount[friend] = giveCount - receiveCount
    }
    
//    print(giftCount)
    var sameCount: Int = 0
    for (friend, count) in giftCount {
        print("count: \(count)")
        if count == giftCount.values.max() {
            sameCount += 1
        }
    }
    print("friendsCount: \(friends.count), sameCount : \(sameCount)")
    
    if giftCount.values.max() == 0 {
        result = 0
    } else if sameCount > 1{
        // 가장 높은 값이 중첩되는 사람이 있다면
        // 전체 인원에서 중첩된 인원수를 뺀 것이 받을 선물이다.
        result = friends.count - (sameCount) // 1을 추가한 이유는 가장 max()인 인원을 더해줘야하기 때문이다.
    } else {
        // 위의 조건에서 해당되지 않는 경우
        // 중첩되는 사람이 없는 경우
        // 전체 인원에서 단 1명을 뺀 것이 받을 선물이다
        result = friends.count - 1
    }
    
    return result
} */
