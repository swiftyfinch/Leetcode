final class Solution {
    func findMedianSortedArrays(_ a: [Int], _ b: [Int]) -> Double {
        if b.count < a.count {
            // Swaping arrays, because it's simply to have the first one smaller.
            return findMedianSortedArrays(b, a)
        }
        
        var left = 0
        var right = a.count
        while left <= right {
            // Trying to partition two arrays on two equal size parts.
            let part1 = (left + right) / 2
            let part2 = (a.count + b.count + 1) / 2 - part1
            
            // Part1           Part2
            // [_, _, _, maxA] [minA, _, _, _]
            // [_, _, _, maxB] [minB, _, _, _]
            
            // Using Int.min as -infinity when part hasn't any elements.
            let part1MaxA = (part1 == 0) ? Int.min : a[part1 - 1]
            let part1MaxB = (part2 == 0) ? Int.min : b[part2 - 1]
            
            // Using Int.max as +infinity when part hasn't any elements.
            let part2MinA = (part1 == a.count) ? Int.max : a[part1]
            let part2MinB = (part2 == b.count) ? Int.max : b[part2]
            
            // Checking that part2 greater than part1.
            if part1MaxA <= part2MinB && part1MaxB <= part2MinA {
                if (a.count + b.count) % 2 == 0 {
                    // If even, then using two elements as median.
                    // Taking max element from part1 and min from part2.
                    return Double(max(part1MaxA, part1MaxB) + min(part2MinA, part2MinB)) / 2
                } else {
                    // Else using one element as median.
                    return Double(max(part1MaxA, part1MaxB))
                }
            } else if part1MaxB > part2MinA {
                left = part1 + 1
            } else {
                right = part1 - 1
            }
        }
        
        fatalError("Incorrect state of algorithm. Please, check given input.")
    }
}