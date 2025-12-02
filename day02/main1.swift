let input = readLine()!.split(separator: ",")
var counter = 0
var index = 0
var value: Int {
    Int("\(index)\(index)")!
}
for i in input {
    let separated = i.split(separator: "-")
    let first = separated[0]
    let range = separated.map {Int($0)!}
    let halfLength = separated[0].count / 2
    index = Int(first[..<first.index(first.startIndex, offsetBy: halfLength)]) ?? 0
    while value < range[0] {
        index += 1
    }
    print(range)
    while value <= range[1] {
        print("* \(value)")
        counter += value
        index += 1
    }
}
print("total:\(counter)")
