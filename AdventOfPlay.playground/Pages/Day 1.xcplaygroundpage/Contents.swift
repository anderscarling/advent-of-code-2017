func resolve(_ list: [Int], jumpFunc: ([Int], Int) -> Int = { ($1 + 1) % $0.count }) -> Int {
    guard list.count > 1 else { return 0 }

    var res = 0
    for (idx, current) in list.enumerated() {
        let nextIdx = jumpFunc(list, idx)
        if current == list[nextIdx] {
            res += current
        }
    }
    return res
}

func resolve(_ list: String) -> Int {
    return resolve(list.flatMap { Int(String($0)) })
}

func resolveAdvanced(_ list: [Int]) -> Int {
    return resolve(list, jumpFunc: { ($1 + $0.count / 2) % $0.count })
}

func resolveAdvanced(_ list: String) -> Int {
    return resolveAdvanced(list.flatMap { Int(String($0)) })
}

assert(resolve([1,1,2,2]) == 3)
assert(resolve([1,2,3,4]) == 0)
assert(resolve([1,1,1,1]) == 4)
assert(resolve([1,2,3,4]) == 0)
assert(resolve([9,1,2,1,2,1,2,9]) == 9)

assert(resolve("1122") == 3)
assert(resolve("1234") == 0)
assert(resolve("1111") == 4)
assert(resolve("1234") == 0)
assert(resolve("91212129") == 9)

assert(resolveAdvanced("1212") == 6)
assert(resolveAdvanced("1221") == 0)
assert(resolveAdvanced("123425") == 4)
assert(resolveAdvanced("123123") == 12)
assert(resolveAdvanced("12131415") == 4)
