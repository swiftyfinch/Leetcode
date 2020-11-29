// Dynamic programming
final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // Using arrays of characters as a simplication
        var (s, p) = (Array(s), Array(p))
        
        // Creating table where rows represents string letters and columns - pattern symbols
        var table = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        
        // If string and pattern empty - it's a full match
        table[0][0] = true
        
        // Handling cases when wildcard symbol use zero times
        for index in table[0].indices.dropFirst() {
            // We need use -1 here because zero row and column don't contain string and pattern symbols
            if p[index - 1] == "*" {
                // Using position in table as if we don't have wildcard at all
                table[0][index] = table[0][index - 2]
            }
        }

        // Traversing over all rows and columns of table
        for row in table.indices.dropFirst() {
            for column in table[row].indices.dropFirst() {
                // So, if we have the same letter in string and pattern or any character symbol
                if s[row - 1] == p[column - 1] || p[column - 1] == "." {
                    // Skipping it and look at solution for shorter string and pattern
                    table[row][column] = table[row - 1][column - 1]
                } else if p[column - 1] == "*" {
                    // If we have wildcard, firstly trying to use it zero times
                    table[row][column] = table[row][column - 2]
                    // And checking if previous pattern symbol the same in string or it's any character
                    if p[column - 2] == "." || p[column - 2] == s[row - 1] {
                        // So, trying to use wildcard several times.
                        // Let's see if we can match the shorter string with the same pattern
                        table[row][column] = table[row][column] || table[row - 1][column]
                    }
                } else {
                    // Nothing to do here
                    table[row][column] = false
                }
            }
        }
        
        // Finaly, return the last column of last row because it's size of full string and pattern
        return table.last!.last!
    }
}