import Foundation

func parse(_ input: String) -> [[Int]] {
    return input
        .components(separatedBy: "\n")
        .map {
            var res: [Int] = []
            let scanner = Scanner(string: $0)
            while !scanner.isAtEnd {
                var int: Int = 0
                if scanner.scanInt(&int) { res.append(int) }
            }
            return res
        }
}

func checksum1(_ lines: [[Int]]) -> Int {
    return lines.reduce(0, { acc, line in
        guard let max = line.max(), let min = line.min() else {
            return acc
        }
        return acc + max - min
    })
}

func checksum2(_ lines: [[Int]]) -> Int {
    return lines.reduce(0, { acc, line in
        for i in line {
            for j in line {
                if i != j, i % j == 0 {
                    return acc + i / j
                }
            }
        }
        fatalError("No match!")
    })
}

assert(18 == checksum1(parse("""
5 1 9 5
7 5 3
2 4 6 8
""")))

assert(9 == checksum2(parse("""
5 9 2 8
9 4 7 3
3 8 6 5
""")))
