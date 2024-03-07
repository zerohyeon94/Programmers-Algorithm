// Lv 1. 추억점수
// https://school.programmers.co.kr/learn/courses/30/lessons/176963
// https://velog.io/@zerohyeon/Lv-1.-%EC%B6%94%EC%96%B5-%EC%A0%90%EC%88%98-zip-inituniqueKeysWithValues

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var personScore: [String: Int] = [:]
    var result: [Int] = []
    
    for (index, person) in name.enumerated() {
        personScore.updateValue(yearning[index], forKey: person)
    }
    
    let zipped = Array(zip(name, yearning))
    
//    print(zipped)
    
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    print(score)
    
    let resultScore = photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
    print(resultScore)
    
//    print(personScore)
    
    for p in photo {
        var score: Int = 0
        for i in p {
            if let personScore = personScore[i] {
                score += personScore
            }
        }
        result.append(score)
    }
    
    return result
}

let name1 = ["may", "kein", "kain", "radi"]
let yearning1 = [5, 10, 1, 3]
let photo1 = [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]

let result1 = solution(name1, yearning1, photo1)
print("result1: \(result1)")

let name2 = ["kali", "mari", "don"]
let yearning2 = [11, 1, 55]
let photo2 = [["kali", "mari", "don"], ["pony", "tom", "teddy"], ["con", "mona", "don"]]

let result2 = solution(name2, yearning2, photo2)
print("result2: \(result2)")

let name3 = ["may", "kein", "kain", "radi"]
let yearning3 = [5, 10, 1, 3]
let photo3 = [["may"],["kein", "deny", "may"], ["kon", "coni"]]

let result3 = solution(name3, yearning3, photo3)
print("result3: \(result3)")

func solution1(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
}
