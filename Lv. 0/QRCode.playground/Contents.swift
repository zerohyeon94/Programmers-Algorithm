import Foundation

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    
    for (index, number) in code.enumerated() {
        print("\(index+1): \(number)")
    }
    
    var result: String = ""
    
    // 입력받은 code를 각각의 character로 분류한다.
    let codeMaps: [String] = code.map {
        String($0)
    }
    
    // codeMaps의 index값을 이용하여 계산한다.
    for index in 0..<codeMaps.count {
        if (index % q) == r {
            // 해당 조건을 만족하는 경우 result와 더하여 단어를 만든다.
            result = "\(result)" + "\(codeMaps[index])"
        }
    }
    
    print("result: \(result)")
    
    return result
}

solution(3, 1, "qjnwezgrpirldywt")

//solution(1, 0, "programmers")

func solutionV1(_ q: Int, _ r: Int, _ code: String) -> String {
    return code.enumerated().filter { $0.offset % q == r }.map { String($0.element) }.joined()
}
