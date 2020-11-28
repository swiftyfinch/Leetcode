// Recursion
// TODO: Use dynamic programming
final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        isMatch(s[...], p[...])
    }
    
    // Overloading with using substrings for better performance
    private func isMatch(_ s: Substring, _ p: Substring) -> Bool {
        if p.isEmpty { return s.isEmpty }
        
        let firstMatch = !s.isEmpty && (p.first == s.first || p.first == ".")
        if p.count > 1 && p.dropFirst().first == "*" {
            let zeroWildcard = isMatch(s, p.dropFirst(2))
            return zeroWildcard || (firstMatch && isMatch(s.dropFirst(), p))
        } else {
            return firstMatch && isMatch(s.dropFirst(), p.dropFirst())
        }
    }
}