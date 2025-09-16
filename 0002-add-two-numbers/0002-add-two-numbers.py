# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        i,n = 0,0
        while (l1.next or l1.val !=0) or (l2.next or l2.val !=0):            
            n += (l1.val + l2.val)*(10**i)
            i += 1
            if l1.next:
                l1=l1.next
            else: 
                l1.val = 0
            if l2.next:
                l2=l2.next
            else: 
                l2.val = 0
 
        out=ListNode()
        l = out
        i = len(str(n))-1
        while i >= 0:
            l.val = n%10
            n = n//10
            i -= 1
            if i >= 0:
                l.next = ListNode()
                l = l.next
            
        return out

        