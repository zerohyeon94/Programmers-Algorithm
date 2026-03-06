import Foundation

// MARK: - 틀린 문제!
// 틀린 이유 : "," 단위로 되고 Set에 문제가 있어서
//func solution(_ s:String) -> [Int] {
//    var result: Set<Int> = []
//    
//    // s를 잘라야하네!
//    // 양 끝 {}를 자른다.
//    let innerString = String(s.dropFirst().dropLast())
//    print("innerString : \(innerString)")
//    
//    let splitString = innerString.split(separator: ",")
//    print("splitString : \(splitString)")
//    
//    for string in splitString {
//        let innerSplitString = string.split(separator: ",")
//        
//        print("innerSplitString : \(innerSplitString)")
//        for innerString in innerSplitString {
//            var s = innerString.trimmingCharacters(in: ["{", "}"])
//            print("s : \(s)")
//            if let intValue = Int(s) {
//                result.insert(intValue) // Set에 넣어!
//            }
//        }
//    }
//    
//    print("result : \(result)")
//    
//    return Array(result)
//}

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var seen: Set<Int> = []
    
    // s를 잘라야하네!
    // 양 끝 {}를 자른다.
    let innerString = String(s.dropFirst(2).dropLast(2)) // 두번씩 자른다.
    print("innerString : \(innerString)")
    
    let splitString = innerString.components(separatedBy: "},{") // 이걸로 묶음대로 분류
    print("splitString : \(splitString)")
    
    let sortedGroup = splitString.sorted { $0.count < $1.count }
    print("sortedGroup : \(sortedGroup)")
    
    for sorted in sortedGroup {
        let numbers = sorted.split(separator: ",").compactMap { s in
            Int(s)
        }
        
        for number in numbers {
            if !seen.contains(number) {
                seen.insert(number)
                result.append(number)
            }
        }
    }
    
    print("result : \(result)")
    
    return Array(result)
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
