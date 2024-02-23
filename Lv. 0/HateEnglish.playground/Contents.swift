import UIKit

func solution(_ numbers:String) -> Int64 {
    
    print("numbers: \(numbers)")
    
    let numbersMap: [String] = numbers.map {
        String($0)
    }
    var result: String = ""
    
    print("numbersMap: \(numbersMap)")
    
    let englishNumber: [String] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    var numberToWord = [Int: String]()
    var wordToNumber = [String: Int]()
    
    for (index, englishNumber) in englishNumber.enumerated() {
        numberToWord[index] = englishNumber
        wordToNumber[englishNumber] = index
    }
    
    print("numberToWord: \(numberToWord)")
    print("wordToNumber: \(wordToNumber)")
    
    var numberString: String = ""
    for i in 0..<numbersMap.count {
        numberString += numbersMap[i]
        if numberToWord.values.contains(numberString) {
//            print("numberString: \(numberString)")
//            print("wordToNumber[numberString]: \(wordToNumber[numberString])")
            result = "\(result)"+"\(wordToNumber[numberString]!)"
            print("result: \(result)")
            numberString = ""
        }
    }
    print("result: \(result)")
    
    return Int64(result) ?? 0
}

solution("zeroonetwothreefourfivesixseveneightnine")

var dic = ["zero" : "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
func solutionV1(_ numbers:String) -> Int64 {
    var answer = numbers
    for (k, v) in dic {
        answer = String(answer.replacingOccurrences(of: k, with: v))
    }
    return Int64(answer)!
}
