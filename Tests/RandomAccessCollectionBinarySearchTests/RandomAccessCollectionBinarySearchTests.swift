import XCTest
@testable import RandomAccessCollectionBinarySearch

final class RandomAccessCollectionBinarySearchTests: XCTestCase {

    func test_empty_collection() {

        let input: [Int] = []

        let (low, target, high) = input.binarySearchLoHi(for: 5)

        XCTAssertEqual(low, nil)
        XCTAssertEqual(target, nil)
        XCTAssertEqual(high, nil)

    }

    func test_single_element_collection() {

        let input = [5]

        var (low, target, high) = input.binarySearchLoHi(for: 1)
        XCTAssertEqual(low, nil)
        XCTAssertEqual(target, nil)
        XCTAssertEqual(high, 0)

        (low, target, high) = input.binarySearchLoHi(for: 5)
        XCTAssertEqual(low, nil)
        XCTAssertEqual(target, 0)
        XCTAssertEqual(high, nil)

        (low, target, high) = input.binarySearchLoHi(for: 10)
        XCTAssertEqual(low, 0)
        XCTAssertEqual(target, nil)
        XCTAssertEqual(high, nil)

    }

    func test_general_size_collection_ascending() {

        // [1, 2, 3, 4, 6, 7, 8, 9] - missing 5
        let input = Array(1 ..< 5) + Array(6 ..< 10)

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (low, target, high) = input.binarySearchLoHi(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 0)
            } else if targetElement == 1 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, 0)
                XCTAssertEqual(high, 1)
            } else if targetElement == 5 {
                XCTAssertEqual(low, 3)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(low, 6)
                XCTAssertEqual(target, 7)
                XCTAssertEqual(high, nil)
            } else if targetElement == 10 {
                XCTAssertEqual(low, 7)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(low, targetElement - 2)
                XCTAssertEqual(target, targetElement - 1)
                XCTAssertEqual(high, targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(low, targetElement - 3)
                XCTAssertEqual(target, targetElement - 2)
                XCTAssertEqual(high, targetElement - 1)
            }
        }

    }

    func test_general_size_collection_descending() {

        // [9, 8, 7, 6, 4, 3, 2, 1] - missing 5
        let input: [Int] = (Array(1 ..< 5) + Array(6 ..< 10)).reversed()

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (low, target, high) = input.binarySearchLoHi(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(low, 7)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(low, 6)
                XCTAssertEqual(target, 7)
                XCTAssertEqual(high, nil)
            } else if targetElement == 5 {
                XCTAssertEqual(low, 3)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, 0)
                XCTAssertEqual(high, 1)
            } else if targetElement == 10 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 0)
            } else if targetElement < 5 {
                XCTAssertEqual(low, 7 - targetElement)
                XCTAssertEqual(target, 8 - targetElement)
                XCTAssertEqual(high, 9 - targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(low, 8 - targetElement)
                XCTAssertEqual(target, 9 - targetElement)
                XCTAssertEqual(high, 10 - targetElement)
            }
        }

    }

    func test_general_size_collection_ascending_no_tuple() {

        // [1, 2, 3, 4, 6, 7, 8, 9] - missing 5
        let input = Array(1 ..< 5) + Array(6 ..< 10)

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let target = input.binarySearch(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(target, 0)
            } else if targetElement == 5 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 9 {
                XCTAssertEqual(target, 7)
            } else if targetElement == 10 {
                XCTAssertEqual(target, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(target, targetElement - 1)
            } else if targetElement < 10 {
                XCTAssertEqual(target, targetElement - 2)
            }
        }

    }

    func test_general_size_collection_descending_no_tuple() {

        // [9, 8, 7, 6, 4, 3, 2, 1] - missing 5
        let input: [Int] = (Array(1 ..< 5) + Array(6 ..< 10)).reversed()

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let target = input.binarySearch(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(target, 7)
            } else if targetElement == 5 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 9 {
                XCTAssertEqual(target, 0)
            } else if targetElement == 10 {
                XCTAssertEqual(target, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(target, 8 - targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(target, 9 - targetElement)
            }
        }

    }

    func test_static_general_size_collection_ascending() {

        // [1, 2, 3, 4, 6, 7, 8, 9] - missing 5
        let input = Array(1 ..< 5) + Array(6 ..< 10)

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (low, target, high) = [Int].binarySearchLoHi(in: input, for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 0)
            } else if targetElement == 1 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, 0)
                XCTAssertEqual(high, 1)
            } else if targetElement == 5 {
                XCTAssertEqual(low, 3)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(low, 6)
                XCTAssertEqual(target, 7)
                XCTAssertEqual(high, nil)
            } else if targetElement == 10 {
                XCTAssertEqual(low, 7)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(low, targetElement - 2)
                XCTAssertEqual(target, targetElement - 1)
                XCTAssertEqual(high, targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(low, targetElement - 3)
                XCTAssertEqual(target, targetElement - 2)
                XCTAssertEqual(high, targetElement - 1)
            }
        }

    }

    func test_static_general_size_collection_descending() {

        // [9, 8, 7, 6, 4, 3, 2, 1] - missing 5
        let input: [Int] = (Array(1 ..< 5) + Array(6 ..< 10)).reversed()

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (low, target, high) = [Int].binarySearchLoHi(in: input, for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(low, 7)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(low, 6)
                XCTAssertEqual(target, 7)
                XCTAssertEqual(high, nil)
            } else if targetElement == 5 {
                XCTAssertEqual(low, 3)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, 0)
                XCTAssertEqual(high, 1)
            } else if targetElement == 10 {
                XCTAssertEqual(low, nil)
                XCTAssertEqual(target, nil)
                XCTAssertEqual(high, 0)
            } else if targetElement < 5 {
                XCTAssertEqual(low, 7 - targetElement)
                XCTAssertEqual(target, 8 - targetElement)
                XCTAssertEqual(high, 9 - targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(low, 8 - targetElement)
                XCTAssertEqual(target, 9 - targetElement)
                XCTAssertEqual(high, 10 - targetElement)
            }
        }

    }

    func test_static_general_size_collection_ascending_no_tuple() {

        // [1, 2, 3, 4, 6, 7, 8, 9] - missing 5
        let input = Array(1 ..< 5) + Array(6 ..< 10)

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let target = [Int].binarySearch(in: input, for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(target, 0)
            } else if targetElement == 5 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 9 {
                XCTAssertEqual(target, 7)
            } else if targetElement == 10 {
                XCTAssertEqual(target, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(target, targetElement - 1)
            } else if targetElement < 10 {
                XCTAssertEqual(target, targetElement - 2)
            }
        }

    }

    func test_static_general_size_collection_descending_no_tuple() {

        // [9, 8, 7, 6, 4, 3, 2, 1] - missing 5
        let input: [Int] = (Array(1 ..< 5) + Array(6 ..< 10)).reversed()

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let target = [Int].binarySearch(in: input, for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 1 {
                XCTAssertEqual(target, 7)
            } else if targetElement == 5 {
                XCTAssertEqual(target, nil)
            } else if targetElement == 9 {
                XCTAssertEqual(target, 0)
            } else if targetElement == 10 {
                XCTAssertEqual(target, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(target, 8 - targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(target, 9 - targetElement)
            }
        }

    }

    func test_general_size_collection_ascending_random() {

        let input = (1 ... 10)
            .map { _ in Double.random(in: 0.25 ... 0.75) }
            .sorted()

        let belowValue = Double.random(in: 0.0 ... 0.2)

        let firstIndex = 0
        let firstValue = input.first!

        let insideIndex = Int.random(in: 1 ..< input.count-1)
        let insideValue = input[insideIndex]

        let lastIndex = input.count - 1
        let lastValue = input.last!

        let aboveValue = Double.random(in: 0.8 ... 1.0)

        var (low, target, high) = input.binarySearchLoHi(for: belowValue)
        XCTAssertEqual(low, nil)
        XCTAssertEqual(target, nil)
        XCTAssertEqual(high, 0)

        (low, target, high) = input.binarySearchLoHi(for: firstValue)
        XCTAssertEqual(low, nil)
        XCTAssertEqual(target, firstIndex)
        XCTAssertEqual(high, firstIndex+1)

        (low, target, high) = input.binarySearchLoHi(for: insideValue)
        XCTAssertEqual(low, insideIndex-1)
        XCTAssertEqual(target, insideIndex)
        XCTAssertEqual(high, insideIndex+1)

        (low, target, high) = input.binarySearchLoHi(for: lastValue)
        XCTAssertEqual(low, lastIndex-1)
        XCTAssertEqual(target, lastIndex)
        XCTAssertEqual(high, nil)

        (low, target, high) = input.binarySearchLoHi(for: aboveValue)
        XCTAssertEqual(low, lastIndex)
        XCTAssertEqual(target, nil)
        XCTAssertEqual(high, nil)

    }

    static var allTests = [

        ("test_empty_collection", test_empty_collection),
        ("test_single_element_collection", test_single_element_collection),

        ("test_general_size_collection_ascending", test_general_size_collection_ascending),
        ("test_general_size_collection_descending", test_general_size_collection_descending),
        ("test_general_size_collection_ascending_no_tuple", test_general_size_collection_ascending_no_tuple),
        ("test_general_size_collection_descending_no_tuple", test_general_size_collection_descending_no_tuple),

        ("test_static_general_size_collection_ascending", test_static_general_size_collection_ascending),
        ("test_static_general_size_collection_descending", test_static_general_size_collection_descending),
        ("test_static_general_size_collection_ascending_no_tuple", test_static_general_size_collection_ascending_no_tuple),
        ("test_static_general_size_collection_descending_no_tuple", test_static_general_size_collection_descending_no_tuple),
        ("test_general_size_collection_ascending_random", test_general_size_collection_ascending_random),

    ]

}
