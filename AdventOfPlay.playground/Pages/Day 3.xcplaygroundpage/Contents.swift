import Foundation

struct Ring {
    let num: Int

    var width: Int {
        return (num * 2) + 1
    }

    var lastSlot: Int {
        return width * width
    }

    var firstSlot: Int {
        guard num > 0 else { return 1 }
        return Ring(num: num - 1).lastSlot + 1
    }

    var centerSlots: [Int] {
        let first = lastSlot - num
        let second = first - num - num
        let third = second - num - num
        let last = third - num - num
        return [first, second, third, last]
    }

    func contains(_ slot: Int) -> Bool {
        return (firstSlot...lastSlot).contains(slot)
    }
}

Ring(num: 0).firstSlot
Ring(num: 0).lastSlot
Ring(num: 0).centerSlots
Ring(num: 1).firstSlot
Ring(num: 1).lastSlot
Ring(num: 1).centerSlots
Ring(num: 2).firstSlot
Ring(num: 2).lastSlot
Ring(num: 2).centerSlots

func distance(for slot: Int) -> Int {
    guard
        let ring = (0...).lazy.map({ Ring(num: $0) }).first(where: { $0.contains(slot) })
    else {
        return -1
    }

    return ring.num + ring.centerSlots.map { abs($0 - slot) }.min()!
}

import Foundation
import XCTest

class OneStarTestCase: XCTestCase {
    func testDistanceForSlot1() {
        XCTAssertEqual(distance(for: 1), 0)
    }
    func testDistanceForSlot12() {
        XCTAssertEqual(distance(for: 12), 3)
    }
    func testDistanceForSlot23() {
        XCTAssertEqual(distance(for: 23), 2)
    }
    func testDistanceForSlot1024() {
        XCTAssertEqual(distance(for: 1024), 31)
    }
}
OneStarTestCase.defaultTestSuite.run()

distance(for: 277678)

