final class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var left = s.startIndex
        var right = s.index(after: left)
        var chars: Set<Character> = [s[left]]
        var maxLength = chars.count
        while right != s.endIndex {
            if !chars.contains(s[right]) {
                chars.insert(s[right])
                maxLength = max(maxLength, chars.count)
                right = s.index(after: right)
            } else {
                chars.remove(s[left])
                left = s.index(after: left)
            }
        }
        return maxLength
    }
}