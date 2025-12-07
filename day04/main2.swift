func printMat(_ matrix: [[Character]]) {
    for row in matrix {
        for char in row {
            print(char, terminator: " ")
        }
        print()
    }
}

var input: [[Character]] = []
while let line = readLine() {
    input.append(Array(line))
}
let deltas: [[Int]] = [
[-1, -1],
[-1, 0],
[-1, 1],
[0, -1],
[0, 1],
[1, -1],
[1, 0],
[1, 1]
]
let size = input.count
var answer = 0
var total = 0
var flag = true
while flag {
    flag = false
    total = 0
    for y in 0..<size {
        for x in 0..<size {
            if input[y][x] == "." {
                continue
            }
            var count = 0
            for delta in deltas {
                let ny = y + delta[0]
                let nx = x + delta[1]
                if 0 <= ny && ny < size && 0 <= nx && nx < size {
                    if input[ny][nx] != "." {
                        count += 1
                    }
                }
            }
            if count < 4 {
                total += 1
                input[y][x] = "x"
            }
        }
    }
    printMat(input)
    if total > 0 {
        flag = true
    }
    answer += total
    for y in 0..<size {
        for x in 0..<size {
            if input[y][x] == "x" {
                input[y][x] = "."
            }
        }
    }
}
print(answer)
