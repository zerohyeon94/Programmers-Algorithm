import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    let holiday = [6, 7] // 토, 일 (1~7)
    var lastTime: [Int] = []
    var isSuccess: Bool = true
    var successCount: Int = 0
    
    // 출근 한계 시간 설정
    for schedule in schedules {
        var limitHour = schedule / 100
        var limitMin = schedule % 100 + 10
        
        if limitMin >= 60 {
            limitHour += 1
            limitMin -= 60
        }
        
        let limitTime = limitHour * 100 + limitMin
        
        lastTime.append(limitTime)
    }
    
    // 각 멤버마다 출근시간 내에 들어오는지 확인
    for (index, day) in timelogs.enumerated() {
        for (i, time) in day.enumerated() {
            
            let dayOfWeek = (startday + i - 1) % 7 + 1
            if holiday.contains(dayOfWeek) {
                continue
            } else {
                if time > lastTime[index] {
                    isSuccess = false
                    
                    break
                }
            }
        }
        
        if isSuccess {
            successCount += 1
            
        }
        
        isSuccess = true
    }
    
    return successCount
}

func solution2(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var successCount = 0
    
    // 직원 수(n) 만큼 반복
    for (index, schedule) in schedules.enumerated() {
        
        // 1. 데드라인 시간 계산 (60진법 고려)
        var limitHour = schedule / 100
        var limitMin = schedule % 100 + 10
        
        if limitMin >= 60 {
            limitHour += 1
            limitMin -= 60
        }
        
        let limitTime = limitHour * 100 + limitMin
        
        // 2. 해당 직원의 일주일 기록 확인
        var isSuccess = true // 일단 성공이라 가정
        
        for (dayIndex, arriveTime) in timelogs[index].enumerated() {
            // 요일 계산 (1:월 ~ 7:일)
            // (시작요일 + 경과일수 - 1) % 7 + 1
            let currentDay = (startday + dayIndex - 1) % 7 + 1
            
            // 토(6), 일(7)은 검사하지 않음 (Pass)
            if currentDay == 6 || currentDay == 7 {
                continue
            }
            
            // 3. 평일에 지각했는지 확인
            if arriveTime > limitTime {
                isSuccess = false // 지각함 -> 실패
                break // 더 볼 필요 없음
            }
        }
        
        // 일주일을 다 돌았는데 여전히 성공 상태라면 카운트 증가
        if isSuccess {
            successCount += 1
        }
    }
    
    return successCount
}


let schedules: [Int] = [700, 800, 1100]
let timelogs: [[Int]] = [[710, 2359, 1050, 700, 650, 631, 659], [800, 801, 805, 800, 759, 810, 809], [1105, 1001, 1002, 600, 1059, 1001, 1100]]
let startday: Int = 5

let result = solution(schedules, timelogs, startday)
print("결과 : \(result)")

let schedules2: [Int] = [730, 855, 700, 720]
let timelogs2: [[Int]] = [[710, 700, 650, 735, 700, 931, 912], [908, 901, 805, 815, 800, 831, 835], [705, 701, 702, 705, 710, 710, 711], [707, 731, 859, 913, 934, 931, 905]]
let startday2: Int = 1

let result2 = solution(schedules2, timelogs2, startday2)
print("결과 : \(result2)")

let result11 = solution2(schedules, timelogs, startday)
print("결과 : \(result11)")
let result12 = solution2(schedules2, timelogs2, startday2)
print("결과 : \(result12)")
