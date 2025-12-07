var input: [[Character]] = []
while let line = readLine() {
    input.append(Array(line))
}
var index: [Int] = [input[0].firstIndex(of: "S")!]
let maxWidth = input[0].count
var dict = [index[0]: 1]
for row in 1..<input.count {
    print("===============================================================")
    var next = [Int:Int]()
    for (k, v) in dict {
        if v == 0 {
            continue
        }
        print(row, k, v, input[row][k], next
    .sorted { $0.key < $1.key }
    .map { "\($0.key): \($0.value)" }
    .joined(separator: ", "))
        if input[row][k] == "." {
                next[k] = v + next[k, default: 0]
        } else {
           next[k - 1] = v + next[k-1, default: 0]
           next[k + 1] = v + next[k+1, default: 0]
        }
    }
    print(row+1, next
    .sorted { $0.key < $1.key }
    .map { "\($0.key): \($0.value)" }
    .joined(separator: ", "))
    dict = next
}
print(dict.values.reduce(0, +))
