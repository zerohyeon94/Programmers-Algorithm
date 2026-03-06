import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsInfo: [String : Int] = [:]
    for term in terms {
        let info = term.split(separator: " ")
        let type: String = String(info[0])
        let validity: Int = Int(info[1])!
        
        termsInfo[type] = validity
    }
    
    print("termsInfo: \(termsInfo)")
    
    var result: [Int] = []
    
    for (index, privacy) in privacies.enumerated() {
        let firstSplit = privacy.split(separator: " ")
        let date: String = String(firstSplit[0])
        let type: String = String(firstSplit[1])
        
        var year: Int = Int(date.split(separator: ".")[0])!
        var month: Int = Int(date.split(separator: ".")[1])!
        var day: Int = Int(date.split(separator: ".")[2])!
        
        for key in termsInfo.keys {
            if key == type {
                month += termsInfo[key]!
                
                while month > 12 {
                    year += 1
                    month -= 12
                }
                
                let compareResult = compareDate(today: today, year: year, month: month, day: day)
                
                if !compareResult {
                    print("파기할 것을 찾음")
                    result.append(index + 1)
                } else {
                    print("아직 유효기간이 남음")
                }
                
                break
                
            } else {
                continue
            }
        }
    }
    
    print(result)
    
    return result
}

func compareDate(today: String, year: Int, month: Int, day: Int) -> Bool {
    let todaySplit = today.split(separator: ".")
    let todayYear: Int = Int(todaySplit[0])!
    let todayMonth: Int = Int(todaySplit[1])!
    let todayDay: Int = Int(todaySplit[2])!
    
    print("today : \(todayYear), \(todayMonth), \(todayDay)")
    print("day : \(year), \(month), \(day)")
    
    if todayYear < year {
        return true // 연도가 낮으면 무조건 통과
    } else if todayYear == year {
        if todayMonth < month {
            return true // 달이 작으면 무조건 통과
        } else if todayMonth == month {
            if todayDay < day { // 일이 작으면 무조건 통과
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    } else {
        print("연도가 지남")
        return false
    }
}

// 다른 방법
func compareDateAnother(today: String, year: Int, month: Int, day: Int) -> Bool {
    let todaySplit = today.split(separator: ".")
    let todayYear = Int(todaySplit[0])!
    let todayMonth = Int(todaySplit[1])!
    let todayDay = Int(todaySplit[2])!
    
    // 2024년 5월 12일 -> 20240512 라는 하나의 숫자로 만듭니다.
    let todayValue = (todayYear * 10000) + (todayMonth * 100) + todayDay
    let targetValue = (year * 10000) + (month * 100) + day
    
    // 두 숫자의 크기만 비교하면 끝!
    return todayValue <= targetValue
}

// 모든 것을 일 단위로 바꾸는 방법
func solutionAnother(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var termsInfo: [String: Int] = [:]
    for term in terms {
        let info = term.split(separator: " ")
        termsInfo[String(info[0])] = Int(info[1])!
    }
    
    // 날짜 문자열을 "총 일(Day) 수"로 변환하는 내부 함수
    // 0년 0월 0일부터 며칠이 지났는지를 나타내는 절대적인 숫자가 됩니다.
    func dateToDays(_ date: String) -> Int {
        let split = date.split(separator: ".").map { Int($0)! }
        let y = split[0]
        let m = split[1]
        let d = split[2]
        
        // 1년은 12달 * 28일, 1달은 28일
        return (y * 12 * 28) + (m * 28) + d
    }
    
    let todayDays = dateToDays(today)
    var result: [Int] = []
    
    for (index, privacy) in privacies.enumerated() {
        let parts = privacy.split(separator: " ")
        let dateStr = String(parts[0])
        let type = String(parts[1])
        
        // 가입 일자를 총 일수로 변환
        let startDays = dateToDays(dateStr)
        // 약관 유효기간(달)을 일수로 변환
        let termDays = termsInfo[type]! * 28
        
        // 만료일(총 일수) = 가입일 + 유효기간
        let expireDays = startDays + termDays
        
        // 오늘 일수가 만료일과 같거나 더 크면 파기!
        if todayDays >= expireDays {
            result.append(index + 1)
        }
    }
    
    return result
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
