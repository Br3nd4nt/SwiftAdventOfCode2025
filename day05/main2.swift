import Foundation
var arr: [[Int]] = []
while let line = readLine(), line.count > 0 {
    let split = line.components(separatedBy: "-")
    let a = Int(split[0])!
    let b = Int(split[1])!
    arr.append([a,b])
}
arr.sort {
    $0[0] < $1[0]
}
var res: [[Int]] = [arr[0]]

for i in 1..<arr.count {
    let last = res.count - 1
    if arr[i][0] > res[last][1] {
        res.append(arr[i])
    } else {
        res[last][1] = max(arr[i][1], res[last][1])
    }
}

print(res)
var total = 0
for i in res {
    total += i[1] - i[0] + 1
}
print(total)
