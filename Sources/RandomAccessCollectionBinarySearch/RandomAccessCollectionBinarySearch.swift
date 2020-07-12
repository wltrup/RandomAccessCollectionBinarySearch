import Foundation

extension RandomAccessCollection where Element: Comparable {

    /// Returns the index of the target element, if it exists in the
    /// input collection, or `nil`, if it does not. It is assumed that
    /// the collection is sorted.
    public static func binarySearch(in input: Self, for targetElement: Element) -> Index? {
        let (_, targetIndex, _) = input.binarySearch(for: targetElement)
        return targetIndex
    }

    // --- //

    /// Returns the index of the target element, if it exists in the
    /// input collection (`self`), or `nil`, if it does not. It is
    /// assumed that the collection is sorted.
    public func binarySearch(for targetElement: Element) -> Index? {
        Self.binarySearch(in: self, for: targetElement)
    }

    // ---------- //

    /// Returns a tuple containing the **indices** of the two collection elements
    /// that narrowly bracket the target element in the input collection
    /// (**assumed sorted**), as well as the **index** of the target element itself.
    /// Note that the index of the target element appears **in the middle** of the
    /// returned tuple `(low, target, high)`, and these three indices are *always*
    /// in *ascending order*, regardless of the sorting order of the input collection.
    ///
    /// The only possible combinations of these indices are:
    ///
    ///   - The collection is *empty*, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, nil)`.
    ///
    ///   - The collection has exactly *one element*, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, 0)`, if the target element is *smaller*
    ///       than the collection's single element.
    ///
    ///     * `(low, target, high) = (nil, 0, nil)`, if the target element is *equal*
    ///       to the collection's single element.
    ///
    ///     * `(low, target, high) = (0, nil, nil)`, if the target element is *larger*
    ///       than the collection's single element.
    ///
    ///   - The collection has *at least two* elements, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is not* in the collection,
    ///       and it is *smaller than* the collection's *smallest* element. `z` is
    ///       then the index of the collection's *smallest* element. This is also
    ///       the returned result when the collection is sorted in *descending order*,
    ///       the target element *is not* in the collection, and it is *larger than*
    ///       the collection's *largest* element. `z` is then the index of the
    ///       collection's *largest* element.
    ///
    ///     * `(low, target, high) = (nil, y, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it *equals* the collection's *smallest* element. `y` is then
    ///       the found index of the target element and `z` is the index of the
    ///       element *just after* that (the *smallest* element that is still
    ///       *larger* than the target element). This is also the returned result
    ///       when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it *equals* the collection's
    ///       *largest* element. `y` is then the found index of the target
    ///       element and `z` is the index of the element *just after* that
    ///       (the *largest* element that is still *smaller* than the target
    ///       element).
    ///
    ///     * `(low, target, high) = (x, y, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it equals some *intermediate* element. `y` is then the found
    ///       index of the target element, `x` is the index of the element
    ///       *just before* that (the *largest* element that is still *smaller*
    ///       than the target element) and `z` is the index of the element
    ///       *just after* the target element (the *smallest* element that is
    ///       still *larger* than the target element). This is also the returned
    ///       result when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it equals some *intermediate*
    ///       element. `y` is then the found index of the target element, `x` is
    ///       the index of the element *just before* that (the *smallest* element
    ///       that is still *larger* than the target element) and `z` is the index
    ///       of the element *just after* the target element (the *largest* element
    ///       that is still *smaller* than the target element).
    ///
    ///     * `(low, target, high) = (x, y, nil)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it *equals* the collection's *largest* element. `y` is then
    ///       the found index of the target element and `x` is the index of
    ///       the element *just before* that (the *largest* element that is
    ///       still *smaller* than the target element). This is also the returned
    ///       result when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it *equals* the collection's
    ///       *smallest* element. `y` is then the found index of the target
    ///       element and `x` is the index of the element *just before* that
    ///       (the *smallest* element that is still *larger* than the target
    ///       element).
    ///
    ///     * `(low, target, high) = (x, nil, nil)`, if the collection is sorted
    ///       in *ascending order*, the target element *is not* in the collection,
    ///       and it is *larger than* the collection's *largest* element. `x` is
    ///       then the index of the collection's *largest* element. This is also
    ///       the returned result when the collection is sorted in *descending order*,
    ///       the target element *is not* in the collection, and it is *smaller than*
    ///       the collection's *smallest* element. `x` is then the index of
    ///       the collection's *smallest* element.
    ///
    /// For collections with integer indices, `y = x+1` and `z = y+1`.
    ///
    public static func binarySearch(in input: Self, for targetElement: Element)
        -> (low: Index?, target: Index?, high: Index?) {
            let (lowIndex, targetIndex, highIndex) = input.binarySearch(for: targetElement)
            return (lowIndex, targetIndex, highIndex)
    }

    // --- //

    /// Returns a tuple containing the **indices** of the two collection elements
    /// that narrowly bracket the target element in the input collection (`self`,
    /// **assumed sorted**), as well as the **index** of the target element itself.
    /// Note that the index of the target element appears **in the middle** of the
    /// returned tuple `(low, target, high)`, and these three indices are *always*
    /// in *ascending order*, regardless of the sorting order of the input collection.
    ///
    /// The only possible combinations of these indices are:
    ///
    ///   - The collection is *empty*, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, nil)`.
    ///
    ///   - The collection has exactly *one element*, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, 0)`, if the target element is *smaller*
    ///       than the collection's single element.
    ///
    ///     * `(low, target, high) = (nil, 0, nil)`, if the target element is *equal*
    ///       to the collection's single element.
    ///
    ///     * `(low, target, high) = (0, nil, nil)`, if the target element is *larger*
    ///       than the collection's single element.
    ///
    ///   - The collection has *at least two* elements, in which case
    ///
    ///     * `(low, target, high) = (nil, nil, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is not* in the collection,
    ///       and it is *smaller than* the collection's *smallest* element. `z` is
    ///       then the index of the collection's *smallest* element. This is also
    ///       the returned result when the collection is sorted in *descending order*,
    ///       the target element *is not* in the collection, and it is *larger than*
    ///       the collection's *largest* element. `z` is then the index of the
    ///       collection's *largest* element.
    ///
    ///     * `(low, target, high) = (nil, y, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it *equals* the collection's *smallest* element. `y` is then
    ///       the found index of the target element and `z` is the index of the
    ///       element *just after* that (the *smallest* element that is still
    ///       *larger* than the target element). This is also the returned result
    ///       when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it *equals* the collection's
    ///       *largest* element. `y` is then the found index of the target
    ///       element and `z` is the index of the element *just after* that
    ///       (the *largest* element that is still *smaller* than the target
    ///       element).
    ///
    ///     * `(low, target, high) = (x, y, z)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it equals some *intermediate* element. `y` is then the found
    ///       index of the target element, `x` is the index of the element
    ///       *just before* that (the *largest* element that is still *smaller*
    ///       than the target element) and `z` is the index of the element
    ///       *just after* the target element (the *smallest* element that is
    ///       still *larger* than the target element). This is also the returned
    ///       result when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it equals some *intermediate*
    ///       element. `y` is then the found index of the target element, `x` is
    ///       the index of the element *just before* that (the *smallest* element
    ///       that is still *larger* than the target element) and `z` is the index
    ///       of the element *just after* the target element (the *largest* element
    ///       that is still *smaller* than the target element).
    ///
    ///     * `(low, target, high) = (x, y, nil)`, if the collection is sorted
    ///       in *ascending order*, the target element *is* in the collection,
    ///       and it *equals* the collection's *largest* element. `y` is then
    ///       the found index of the target element and `x` is the index of
    ///       the element *just before* that (the *largest* element that is
    ///       still *smaller* than the target element). This is also the returned
    ///       result when the collection is sorted in *descending order*, the target
    ///       element *is* in the collection, and it *equals* the collection's
    ///       *smallest* element. `y` is then the found index of the target
    ///       element and `x` is the index of the element *just before* that
    ///       (the *smallest* element that is still *larger* than the target
    ///       element).
    ///
    ///     * `(low, target, high) = (x, nil, nil)`, if the collection is sorted
    ///       in *ascending order*, the target element *is not* in the collection,
    ///       and it is *larger than* the collection's *largest* element. `x` is
    ///       then the index of the collection's *largest* element. This is also
    ///       the returned result when the collection is sorted in *descending order*,
    ///       the target element *is not* in the collection, and it is *smaller than*
    ///       the collection's *smallest* element. `x` is then the index of
    ///       the collection's *smallest* element.
    ///
    /// For collections with integer indices, `y = x+1` and `z = y+1`.
    ///
    public func binarySearch(for targetElement: Element)
        -> (low: Index?, target: Index?, high: Index?) {

        guard isEmpty == false else { return (nil, nil, nil) }

        guard count > 1 else {

            // target element found
            if targetElement == self[startIndex] {
                return (nil, startIndex, nil)
            }

            // target element not found
            if targetElement < self[startIndex] {
                return (nil, nil, startIndex)
            } else {
                return (startIndex, nil, nil)
            }

        }

        let firstValidIndex = startIndex
        let lastValidIndex = index(before: endIndex)

        let isSortedAscending = self[lastValidIndex] > self[firstValidIndex]

        var lowerIndex = firstValidIndex
        var upperIndex = lastValidIndex

        if isSortedAscending {

            while (true) {

                let upperMinusLower = distance(from: lowerIndex, to: upperIndex)

                if upperMinusLower == 0 { // upperIndex == lowerIndex

                    // is the index pointing to the first element?
                    if lowerIndex == firstValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the first element
                            return (nil, index(after: firstValidIndex), firstValidIndex)
                        } else {
                            // target element not found
                            return (nil, nil, firstValidIndex)
                        }
                    }

                    // is the index pointing to the last element?
                    if lowerIndex == lastValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the last element
                            return (index(before: lastValidIndex), nil, lastValidIndex)
                        } else {
                            // target element not found
                            return (lastValidIndex, nil, nil)
                        }
                    }

                    // the index is pointing to an intermediate element
                    if self[lowerIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (index(before: lowerIndex), index(after: lowerIndex), lowerIndex)
                    } else {
                        // target element not found but it is bracketed
                        if self[lowerIndex] < targetElement {
                            return (lowerIndex, index(after: lowerIndex), nil)
                        } else {
                            return (index(before: lowerIndex), lowerIndex, nil)
                        }
                    }

                }

                if upperMinusLower == 1 { // upperIndex == lowerIndex + 1

                    // is lowerIndex pointing to the first element?
                    if lowerIndex == firstValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the first element
                            return (nil, firstValidIndex, upperIndex)
                        } else if self[upperIndex] == targetElement {
                            // target element found and it is the second element
                            return (firstValidIndex, index(after: upperIndex), upperIndex)
                        } else {
                            // target element not found
                            return (nil, nil, firstValidIndex)
                        }
                    }

                    // is upperIndex pointing to the last element?
                    if upperIndex == lastValidIndex {
                        if self[upperIndex] == targetElement {
                            // target element found and it is the last element
                            return (lowerIndex, lastValidIndex, nil)
                        } else if self[lowerIndex] == targetElement {
                            // target element found and it is the next-to-last element
                            return (index(before: lowerIndex), lastValidIndex, lowerIndex)
                        } else {
                            // target element not found
                            return (lastValidIndex, nil, nil)
                        }
                    }

                    // lowerIndex and upperIndex are pointing to adjacent elements
                    // that are not at the edges of the input collection

                    if self[lowerIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (index(before: lowerIndex), upperIndex, lowerIndex)
                    }

                    if self[upperIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (lowerIndex, index(after: upperIndex), upperIndex)
                    }

                    // target element not found but it is bracketed
                    return (lowerIndex, nil, upperIndex)

                }

                // upperMinusLower > 1

                let currentIndex = self.index(lowerIndex, offsetBy: upperMinusLower / 2)

                if self[currentIndex] == targetElement {
                    // target element found and it is an intermediate element
                    return (index(before: currentIndex), index(after: currentIndex), currentIndex)
                }

                if (self[currentIndex] > targetElement) {
                    upperIndex = self.index(before: currentIndex)
                } else {
                    lowerIndex = self.index(after: currentIndex)
                }

            }

        } else {

            while (true) {

                let upperMinusLower = distance(from: lowerIndex, to: upperIndex)

                if upperMinusLower == 0 { // upperIndex == lowerIndex

                    // is the index pointing to the first element?
                    if lowerIndex == firstValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the first element
                            return (nil, index(after: firstValidIndex), firstValidIndex)
                        } else {
                            // target element not found
                            return (nil, nil, firstValidIndex)
                        }
                    }

                    // is the index pointing to the last element?
                    if lowerIndex == lastValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the last element
                            return (index(before: lastValidIndex), nil, lastValidIndex)
                        } else {
                            // target element not found
                            return (lastValidIndex, nil, nil)
                        }
                    }

                    // the index is pointing to an intermediate element
                    if self[lowerIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (index(before: lowerIndex), index(after: lowerIndex), lowerIndex)
                    } else {
                        // target element not found but it is bracketed
                        if self[lowerIndex] < targetElement {
                            return (lowerIndex, index(after: lowerIndex), nil)
                        } else {
                            return (index(before: lowerIndex), lowerIndex, nil)
                        }
                    }

                }

                if upperMinusLower == 1 { // upperIndex == lowerIndex + 1

                    // is lowerIndex pointing to the first element?
                    if lowerIndex == firstValidIndex {
                        if self[lowerIndex] == targetElement {
                            // target element found and it is the first element
                            return (nil, firstValidIndex, upperIndex)
                        } else if self[upperIndex] == targetElement {
                            // target element found and it is the second element
                            return (firstValidIndex, index(after: upperIndex), upperIndex)
                        } else {
                            // target element not found
                            return (nil, nil, firstValidIndex)
                        }
                    }

                    // is upperIndex pointing to the last element?
                    if upperIndex == lastValidIndex {
                        if self[upperIndex] == targetElement {
                            // target element found and it is the last element
                            return (lowerIndex, lastValidIndex, nil)
                        } else if self[lowerIndex] == targetElement {
                            // target element found and it is the next-to-last element
                            return (index(before: lowerIndex), lastValidIndex, lowerIndex)
                        } else {
                            // target element not found
                            return (lastValidIndex, nil, nil)
                        }
                    }

                    // lowerIndex and upperIndex are pointing to adjacent elements
                    // that are not at the edges of the input collection

                    if self[lowerIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (index(before: lowerIndex), upperIndex, lowerIndex)
                    }

                    if self[upperIndex] == targetElement {
                        // target element found and it is an intermediate element
                        return (lowerIndex, index(after: upperIndex), upperIndex)
                    }

                    // target element not found but it is bracketed
                    return (lowerIndex, nil, upperIndex)

                }

                // upperMinusLower > 1

                let currentIndex = self.index(lowerIndex, offsetBy: upperMinusLower / 2)

                if self[currentIndex] == targetElement {
                    // target element found and it is an intermediate element
                    return (index(before: currentIndex), index(after: currentIndex), currentIndex)
                }

                if (self[currentIndex] > targetElement) {
                    upperIndex = self.index(before: currentIndex)
                } else {
                    lowerIndex = self.index(after: currentIndex)
                }

            }

        }

    }

}
