final class Solution {
    func myAtoi(_ s: String) -> Int {
        guard let begin = s.firstIndex(where: { $0 != " " }) else { return 0 }
        
        var number = 0
        for index in s[begin...].indices {
            guard let candidate = Int(s[begin...index]) else {
                if index == begin { continue }
                return number
            }
            
            if candidate < Int32.min {
                return Int(Int32.min)
            } else if candidate > Int32.max {
                return Int(Int32.max)
            }
            number = candidate
        }
        return number
    }
}