import Foundation 
var coords: [[Int]] = []

while let line = readLine() {
    coords.append(line.split(separator: ",").map { Int($0)! })
}
let n = coords.count
var dist: [[Int]] = []
for i in 0..<n {
    for j in (i+1)..<n {
        let a = coords[i]
        let b = coords[j]
        var val = 0
        for q in 0..<3 {
            val += (a[q] - b[q]) * (a[q] - b[q])
        }
        dist.append([val, i, j])
    }
}
dist.sort {
    $0[0] < $1[0]
}

var parent: [Int: Int] = [:]
for i in 0..<n {
    parent[i] = i
}
func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x]!)
    return parent[x]!
}

func merge(_ x: Int, _ y: Int) {
    parent[find(y)] = find(x)
}

var connections = 0

for d in dist {
    let (_, u, v) = (d[0], d[1], d[2])
    if find(u) != find(v) {
        merge(u, v)
        connections += 1
        if connections == n-1 {
            print(coords[u][0] * coords[v][0])
            break
        }
    }
}
