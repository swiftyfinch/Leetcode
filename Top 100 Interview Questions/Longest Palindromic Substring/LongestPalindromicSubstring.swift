final class Solution {
    func longestPalindrome(_ s: String) -> String {
        let string = Array(s)
        var range = (left: 0, right: 0)
        for index in string.indices {
            let odd = expand(string, left: index, right: index)
            let even = expand(string, left: index, right: index + 1)
            let max = (odd.right - odd.left > even.right - even.left) ? odd : even
            if max.right - max.left > range.right - range.left {
                range = max
            }
        }
        return String(string[range.left...range.right])
    }

    private func expand(_ string: [Character], left: Int, right: Int) -> (left: Int, right: Int) {
        var (left, right) = (left, right)
        while left >= 0 && right < string.count && string[left] == string[right] {
            left -= 1
            right += 1
        }
        return (left + 1, right - 1)
    }
}