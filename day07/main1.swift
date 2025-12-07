var input: [[Character]] = []
while let line = readLine() {
    input.append(Array(line))
}
var index: [Int] = [input[0].firstIndex(of: "S")!]
var next: [Int] = []
let maxWidth = input[0].count
var count = 0
for row in 1..<input.count {
    for i in index {
        if input[row][i] == "." {
            if !next.contains(i) {
                next.append(i)
            }
        } else {
            count += 1
            if i - 1 >= 0 {
                if !next.contains(i - 1) {
                    next.append(i - 1)
                }
            }
            if i + 1 < maxWidth {
                if !next.contains(i + 1) {
                    next.append(i + 1)
                }
            }
        }
    }
    for i in index {
        input[row][i] = "|"
    }
    index = next
    next = []
}
print(count)
print(index)
for i in input {
    print(String(i))
}
