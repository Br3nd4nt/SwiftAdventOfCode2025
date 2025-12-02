var dial = 50
var counter = 0
while let line = readLine() {
    let turn = line.prefix(1)
    let angle = Int(line.dropFirst(1))!
    if turn == "R" {
        dial = (100 + dial + angle) % 100
    } else {
        dial = (100 + dial - angle) % 100
    }
    if dial == 0 {
        counter += 1
    }
    print("turning \(angle) to \(turn) -> \(dial)\tcounter: \(counter)")
}

print(counter)
