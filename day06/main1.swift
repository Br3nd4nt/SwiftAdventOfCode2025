import Foundation

var input: [[String]] = []
var size = 0
while let line = readLine() {
    var split = line.components(separatedBy: " ")
    for i in (0..<split.count).reversed() {
        if split[i].count == 0 {
            split.remove(at: i)
        }
    }
    input.append(split)
    size = split.count
}
var total = 0
for i in 0..<size {
    var res: Int
    if input.last![i] == "+" {
        res = 0
        for j in 0..<(input.count - 1) {
            res += Int(input[j][i])!
        }
    } else {
        res = 1
        for j in 0..<(input.count - 1) {
            res *= Int(input[j][i])!
        }
    }
    total += res
}
print(total)

