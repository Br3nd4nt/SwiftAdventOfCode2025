import Foundation 
var coords: [[Int]] = []

while let line = readLine() {
    coords.append(line.split(separator: ",").map { Int($0)! })
}
let n = coords.count
var dist: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)

for i in 0..<n {
    for j in (i+1)..<n {
        let a = coords[i]
        let b = coords[j]
        var val = 0
        for q in 0..<3 {
            val += (a[q] - b[q]) * (a[q] - b[q])
        }
        dist[i][j] = val
        dist[j][i] = val
    }
}

let N = 1000
var connections: [[Int]] = []
for iter in 0..<N {
    print(iter, connections)
    var minCoord: (row: Int, col: Int)?
    var minVal = Int.max
    dist.enumerated().forEach {row, arr in
        arr.enumerated().forEach {col, val in 
            if val < minVal {
                minCoord = (row, col)
                minVal = val
            }

        }
    }
    guard let minCoord = minCoord else {
        print("wtf")
        exit(1)
    }
    print(minCoord)
    dist[minCoord.row][minCoord.col] = Int.max
    dist[minCoord.col][minCoord.row] = Int.max
    var first: Int?
    var second: Int?
    for i in 0..<connections.count {
        if connections[i].contains(minCoord.row) {
            first = i
        }
        if connections[i].contains(minCoord.col) {
            second = i
        }
    }
    guard let first = first else {
        guard let second = second else {
            connections.append([minCoord.row, minCoord.col])
            continue
        }
        connections[second].append(minCoord.row)
        continue
    }
    guard let second = second else {
        connections[first].append(minCoord.col)
        continue
    }
    if first == second {
        continue
    }
    let merged = connections[first] + connections[second]
    connections.remove(at: max(first, second))
    connections.remove(at: min(first, second))
    connections.append(merged)
}
connections.sort {
    $0.count > $1.count
}
print(connections)
print(connections[0].count * connections[1].count * connections[2].count)
