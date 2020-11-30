final class Solution {
    func romanToInt(_ string: String) -> Int {
        let map: [Character: Int] = [
            "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000
        ]
        
        var number = 0
        var index = string.startIndex
        while index != string.endIndex {
            guard let char = map[string[index]] else { return -1 }
            
            let next = string.index(after: index)
            if next < string.endIndex, let nextChar = map[string[next]], char < nextChar {
                number += nextChar - char
                index = string.index(after: next)
            } else {
                number += char
                index = next
            }
        }
        return number
    }
}