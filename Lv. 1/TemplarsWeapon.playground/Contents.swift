import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var templarsPower: [Int] = [] // 기사들의 파워
    var weightOfIron: Int = 0
    
    for templar in 1...number {
        var templarPower = 0
        
        // 어차피 가운데 값을 기준으로 좌우 대칭이므로,
        // 단, 가운데 값을 제곱했을 때 입력된 값일 경우 이는 값을 +1 해줘야한다.
        for p in 1...Int(sqrt(Double(templar))) {
            if templar % p == 0 {
                if p * p == templar {
                    templarPower += 1
                } else {
                    templarPower += 2
                }
            }
        }
        
        templarPower = templarPower > limit ? power : templarPower
        
        templarsPower.append(templarPower)
    }
    
    print(templarsPower)
    
    weightOfIron = templarsPower.reduce(0) { $0 + $1 }
    
    return weightOfIron
}

solution(5, 3, 2)
solution(10, 3, 2)


// 시간 초과 실패
func solutionFail(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var templarsPower: [Int] = [] // 기사들의 파워
    var weightOfIron: Int = 0
    
    for templar in 1...number {
        templarsPower.append(divisor(templar)) // 약수를 구한 후 약수들의 파워를 저장.
    }
    
    for (index, templarPower) in templarsPower.enumerated() {
        if templarPower > limit {
            // 기준보다 높을 경우 기준으로 맞추기
            templarsPower[index] = power
        } else {
            continue
        }
    }
    
    print(templarsPower)
    
    for weight in templarsPower {
        weightOfIron += weight
    }
    
    return weightOfIron
}

func divisor(_ number: Int) -> Int {
    return (1...number).filter { number % $0 == 0 }.count
}

print("------")
solutionFail(5, 3, 2)
solutionFail(10, 3, 2)
