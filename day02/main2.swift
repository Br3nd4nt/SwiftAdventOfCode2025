import Foundation

let input = readLine()!.split(separator: ",")
var counter = 0

let regex = try! NSRegularExpression(pattern: #"^(\d+)\1+$"#)

for i in input {
    let separated = i.split(separator: "-")
    let range = separated.map {Int($0)!}
    print(range)
    for i in range[0]...range[1] {
        let s = String(i)
        
        if regex.firstMatch(in: s, range: NSRange(s.startIndex..<s.endIndex, in: s)) != nil {
            print(i)
            counter += i
        }
    }
}
print("total:\(counter)")
