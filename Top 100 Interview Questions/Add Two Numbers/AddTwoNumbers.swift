/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
final class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var over = 0
        var head: ListNode?
        var tail: ListNode?
        var current1 = l1
        var current2 = l2
        while current1 != nil || current2 != nil || over != 0 {
            let value1 = current1?.val ?? 0
            current1 = current1?.next
            let value2 = current2?.val ?? 0
            current2 = current2?.next

            var sum = value1 + value2 + over
            over = sum / 10
            sum %= 10

            let newNode = ListNode(sum)
            if head == nil {
                head = newNode
            } else {
                tail?.next = newNode
            }
            tail = newNode
        }
        return head
    }
}
