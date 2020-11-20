final class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (index, value) in nums.enumerated() {
            let remainder = target - value
            if let rightIndex = map[remainder] {
                return [index, rightIndex]
            }
            map[value] = index
        }
        return []
    }
}
