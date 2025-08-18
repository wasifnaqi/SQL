class Solution:
    def isPalindrome(self, x: int) -> bool:
        A1=x
        N = 0
        while x > 0:
            N = (N*10) + (x%10)
            x //= 10
        return A1==N
  

            

        