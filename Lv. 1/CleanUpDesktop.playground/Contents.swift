import Foundation

func solution1(_ wallpaper:[String]) -> [Int] {
    var lux: Int = 0
    var luy: Int = 0
    
    var rdx: Int = 0
    var rdy: Int = 0
    
    var xArray: [Int] = []
    var yArray: [Int] = []
    
    for (x, value) in wallpaper.enumerated() {
        if value.contains("#"){
            for (y, value) in value.enumerated() {
                if value == "#" {
                    //                    print("파일의 위치는 x: \(x), y: \(y)")
                    xArray.append(x)
                    yArray.append(y)
                }
            }
        }
    }
    
    guard !xArray.isEmpty, !yArray.isEmpty else {
        return [0]
    }
    
    lux = xArray.min()!
    luy = yArray.min()!
    
    rdx = xArray.max()! + 1
    rdy = yArray.max()! + 1
    
    return [lux, luy, rdx, rdy]
}

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map { Array($0) }
    let (n, m) = (wallpaper.count, wallpaper[0].count)
    var (minX, minY, maxX, maxY) = (51, 51, -1, -1)
    
    print(wallpaper)
    print(n, m)

    for i in 0..<n {
        for j in 0..<m {
            if wallpaper[i][j] == "#" {
                (minX, minY) = (min(minX, i), min(minY, j))
                print((minX, minY))
                (maxX, maxY) = (max(maxX, i), max(maxY, j))
                print((maxX, maxY))
            }
        }
    }

    return [minX, minY, maxX+1, maxY+1]
}

let result1 = solution([".#...", "..#..", "...#."])
let result2 = solution(["..........", ".....#....", "......##..", "...##.....", "....#....."])
let result3 = solution([".##...##.", "#..#.#..#", "#...#...#", ".#.....#.", "..#...#..", "...#.#...", "....#...."])
let result4 = solution(["..", "#."])

print(result1)
print(result2)
print(result3)
print(result4)
