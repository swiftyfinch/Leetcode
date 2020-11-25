final class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x != 0 {
            let last = x % 10
            x /= 10
            result = result * 10 + last
        }
        return abs(result) > Int32.max ? 0 : result
    }
}