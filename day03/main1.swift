
var total = 0
while let line = readLine(), line.count > 0 {
    var first = 0
    for i in 0...line.count-2 {
        if line[i] > line[first] {
            first = i
        }
        if line[first] == "9" {
            break
        }
    }
    var second = first + 1
    for i in first+1...line.count {
        if line[i] > line[second] {
            second = i
        }
    }
    let value = Int("\(line[first])\(line[second])")!
    print(line, value)
    total += value
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
