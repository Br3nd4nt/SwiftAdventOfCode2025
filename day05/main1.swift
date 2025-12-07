import Foundation
var range: [[Int]] = []

while let line = readLine(), line.count > 0 {
    let split = line.components(separatedBy: "-")
    range.append([Int(split[0])!,Int(split[1])!])
}

var total = 0

while let line = readLine(), let val = Int(line) {
    for i in range {
        if i[0] <= val && val <= i[1] {
            total += 1
            break
        }
    }
}
print(total)
