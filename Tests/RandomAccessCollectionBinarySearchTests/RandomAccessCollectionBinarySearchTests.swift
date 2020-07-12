import XCTest
@testable import RandomAccessCollectionBinarySearch

final class RandomAccessCollectionBinarySearchTests: XCTestCase {

    func test_empty_collection() {

        let input: [Int] = []

        let (lowIndex, targetIndex, highIndex) = input.binarySearch(for: 5)

        XCTAssertEqual(lowIndex, nil)
        XCTAssertEqual(targetIndex, nil)
        XCTAssertEqual(highIndex, nil)

    }

    func test_single_element_collection() {

        let input = [5]

        var (lowIndex, targetIndex, highIndex) = input.binarySearch(for: 1)
        XCTAssertEqual(lowIndex, nil)
        XCTAssertEqual(targetIndex, nil)
        XCTAssertEqual(highIndex, 0)

        (lowIndex, targetIndex, highIndex) = input.binarySearch(for: 5)
        XCTAssertEqual(lowIndex, nil)
        XCTAssertEqual(targetIndex, 0)
        XCTAssertEqual(highIndex, nil)

        (lowIndex, targetIndex, highIndex) = input.binarySearch(for: 10)
        XCTAssertEqual(lowIndex, 0)
        XCTAssertEqual(targetIndex, nil)
        XCTAssertEqual(highIndex, nil)

    }

    func test_general_size_collection_ascending() {

        // [1, 2, 3, 4, 6, 7, 8, 9] - missing 5
        let input = Array(1 ..< 5) + Array(6 ..< 10)

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (lowIndex, targetIndex, highIndex) = input.binarySearch(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(lowIndex, nil)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, 0)
            } else if targetElement == 1 {
                XCTAssertEqual(lowIndex, nil)
                XCTAssertEqual(targetIndex, 0)
                XCTAssertEqual(highIndex, 1)
            } else if targetElement == 5 {
                XCTAssertEqual(lowIndex, 3)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(lowIndex, 6)
                XCTAssertEqual(targetIndex, 7)
                XCTAssertEqual(highIndex, nil)
            } else if targetElement == 10 {
                XCTAssertEqual(lowIndex, 7)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(lowIndex, targetElement - 2)
                XCTAssertEqual(targetIndex, targetElement - 1)
                XCTAssertEqual(highIndex, targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(lowIndex, targetElement - 3)
                XCTAssertEqual(targetIndex, targetElement - 2)
                XCTAssertEqual(highIndex, targetElement - 1)
            }
        }

    }

    func test_general_size_collection_descending() {

        // [9, 8, 7, 6, 4, 3, 2, 1] - missing 5
        let input: [Int] = (Array(1 ..< 5) + Array(6 ..< 10)).reversed()

        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for targetElement in Array(0 ... 10) {
            let (lowIndex, targetIndex, highIndex) = input.binarySearch(for: targetElement)
            if targetElement == 0 {
                XCTAssertEqual(lowIndex, nil)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, 0)
            } else if targetElement == 1 {
                XCTAssertEqual(lowIndex, nil)
                XCTAssertEqual(targetIndex, 0)
                XCTAssertEqual(highIndex, 1)
            } else if targetElement == 5 {
                XCTAssertEqual(lowIndex, 3)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, 4)
            } else if targetElement == 9 {
                XCTAssertEqual(lowIndex, 6)
                XCTAssertEqual(targetIndex, 7)
                XCTAssertEqual(highIndex, nil)
            } else if targetElement == 10 {
                XCTAssertEqual(lowIndex, 7)
                XCTAssertEqual(targetIndex, nil)
                XCTAssertEqual(highIndex, nil)
            } else if targetElement < 5 {
                XCTAssertEqual(lowIndex, targetElement - 2)
                XCTAssertEqual(targetIndex, targetElement - 1)
                XCTAssertEqual(highIndex, targetElement)
            } else if targetElement < 10 {
                XCTAssertEqual(lowIndex, targetElement - 3)
                XCTAssertEqual(targetIndex, targetElement - 2)
                XCTAssertEqual(highIndex, targetElement - 1)
            }
        }

    }

    static var allTests = [
        ("test_empty_collection", test_empty_collection),
        ("test_single_element_collection", test_single_element_collection),
        ("test_general_size_collection_ascending", test_general_size_collection_ascending),
        ("test_general_size_collection_descending", test_general_size_collection_descending),
    ]

}
