var dial = 50
var counter = 0
while let line = readLine() {
    let turn = line.prefix(1)
    var angle = Int(line.dropFirst(1))!
    var target: Int
    let initialLaps = angle / 100
    counter += initialLaps
    angle %= 100
    if turn == "R" {
        target = dial + angle
    } else {
        target = dial - angle
    }
    let det = target * dial
    if det < 0 {
        counter += 1
    } else if det == 0 {
        if target % 100 == 0 {
            counter += 1
        }
    }
    counter += target / 100
    print("\(turn) turn with \(initialLaps) laps from \(dial) to \(target) with \(angle) counter: \(counter)")
    dial = (100 + target) % 100
}

print(counter)
