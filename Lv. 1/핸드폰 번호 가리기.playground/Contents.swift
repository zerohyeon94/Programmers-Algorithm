import Foundation

func solution(_ phone_number:String) -> String {
    let phoneNumber = phone_number.reversed()
    let count = 4
    var result = ""
    
    for (index, text) in phoneNumber.enumerated() {
        if index < count {
            result.append(text)
        } else {
            result.append("*")
        }
    }
    
    print("result : \(result)")
    result = String(result.reversed())
    print("result : \(result)")
    
    return result
}

let test1 = "01033334444"
let test2 = "027778888"

solution(test1)
solution(test2)
