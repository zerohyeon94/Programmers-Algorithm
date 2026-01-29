import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id
    
    id = firstFilter(id)
    print("first id : \(id)")
    id = secondFilter(id)
    print("second id : \(id)")
    id = thirdFilter(id)
    print("third id : \(id)")
    id = forthFilter(id)
    print("forth id: \(id)")
    id = fifthFilter(id)
    print("fifth id: \(id)")
    id = sixthFilter(id)
    print("sixth id: \(id)")
    id = seventhFilter(id)
    print("seventh id: \(id)")
    
    return id
}

func firstFilter(_ str:String) -> String {
    return str.lowercased()
}

func secondFilter(_ str:String) -> String {
    let agreeText: [Character] = ["-", "_", "."]
    
    let filteredString = str.filter { agreeText.contains($0) || $0.isLetter || $0.isNumber }
    
    return String(filteredString)
}

func thirdFilter(_ str:String) -> String {
    var result = ""
    
    for char in str {
        if char == "." && result.last == "." {
            continue
        }
        result.append(char)
    }
    
    return result
}

func forthFilter(_ str:String) -> String {
    var newStr = str
    
    if newStr.first == "." {
        newStr.removeFirst()
    }
    
    if newStr.last == "." {
        newStr.removeLast()
    }
    
    return newStr
}

// 다른 방법
//func forthFilter(_ str: String) -> String {
//    // 양 끝에 있는 특정 문자들을 싹 다 제거해줍니다.
//    return str.trimmingCharacters(in: ["."])
//}

func fifthFilter(_ str:String) -> String {
    return str.isEmpty ? "a" : str
}

func sixthFilter(_ str:String) -> String {
    var newStr = str
    
    if newStr.count > 15 {
        newStr = String(newStr.prefix(15))
    }
    
    if newStr.last == "." {
        newStr.removeLast()
    }
    
    return newStr
}

func seventhFilter(_ str:String) -> String {
    var result = str
    
    while result.count < 3 {
        if let last = result.last {
            result.append(last)
        }
    }
    
    return result
}

let test1 = "...!@BaT#*..y.abcdefghijklm"
let test2 = "z-+.^."
let test3 = "=.="
let test4 = "123_.def"
let test5 = "abcdefghijklmn.p"

solution(test2)
