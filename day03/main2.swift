
var total = 0
while let line = readLine(), line.count > 0 {
    var indicies: [Int] = []
    var startIndex = 0
    let indiciesCount = 12
    for current in 0..<indiciesCount {
        indicies.append(startIndex)
        var q = "\(current) - "
        for index in startIndex..<(line.count-indiciesCount+current+1) {
            q = "\(q),\(index)"
            if Int(line[index])! > Int(line[indicies[current]])! {
                indicies[current] = index
            }
        }
        print(q, indicies)
        startIndex = indicies[current] + 1
    }
    var result = ""
    for i in indicies {
        result = "\(result)\(line[i])"
    }
    print(line, result, indicies)
    total += Int(result)!
    print("=====================================================================================================")
}

print("total:\(total)")

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
