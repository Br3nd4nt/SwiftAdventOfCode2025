import Foundation

var input: [[Character]] = []

while let line = readLine() {
    input.append(Array(line))
}
let operations: [Character] = input.last!.filter {$0 != " "}
input.remove(at: input.count - 1)
let height = input.count
let width = input[0].count
var matrix = Array(repeating: Array(repeating: 0, count: width), count: height)

var spaces: [Int] = []

for x in (0..<input[0].count).reversed() {
    var flag = true
    for y in 0..<height {
        if input[y][x] != " " {
            flag = false
            print(y, x, input[y][x])
            break
        }
    }
    if flag {
        spaces.append(x)
    }
}
for i in input {
    print(i)
}
print(spaces)
var total = 0
var values: [Int] = []
var opIndex = operations.count - 1
for x in (0..<width).reversed() {
    if spaces.contains(x) {
        var val: Int
        if operations[opIndex] == "+" {
            val = 0
            for i in values {
                val += i
            }
        } else {
            val = 1
            for i in values {
                val *= i
            }
        }
        print("*** \(val)")
        total += val
        opIndex -= 1
        values = []
        continue
    }
    var line = ""
    for y in (0..<height).reversed() {
        line = "\(input[y][x])\(line)"
    }
    print(line)
    values.append(Int(line.trimmingCharacters(in: .whitespacesAndNewlines))!)
}
var val: Int
if operations[opIndex] == "+" {
    val = 0
    for i in values {
        val += i
    }
} else {
    val = 1
    for i in values {
        val *= i
    }
}
total += val
print(total)
