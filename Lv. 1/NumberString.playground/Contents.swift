import Foundation

let englishNumber: [String] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

func solution(_ s:String) -> Int {
    var result: String = ""
    var word: String = ""
    var englishNumberDictionary = [String: Int]()
    
    for (index, number) in englishNumber.enumerated(){
        englishNumberDictionary[number] = index
    }
    
    for number in s.enumerated() {
        if number.element.isNumber {
            result += String(number.element)
        } else {
            word += String(number.element)
            if englishNumber.contains(word) {
                result += String(englishNumberDictionary[word] ?? 0)
                word = ""
            }
        }
    }
    
    return Int(result) ?? 0
}

solution("2three45sixseven")

func solutionV1(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}

let s = "2three45sixseven"

for number in s.enumerated() {
    print(number)
}

//(offset: 0, element: "2")
//(offset: 1, element: "t")
//(offset: 2, element: "h")
//(offset: 3, element: "r")
//(offset: 4, element: "e")
//(offset: 5, element: "e")
//(offset: 6, element: "4")
//(offset: 7, element: "5")
//(offset: 8, element: "s")
//(offset: 9, element: "i")
//(offset: 10, element: "x")
//(offset: 11, element: "s")
//(offset: 12, element: "e")
//(offset: 13, element: "v")
//(offset: 14, element: "e")
//(offset: 15, element: "n")

