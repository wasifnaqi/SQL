class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        count = 0
        cur = 0
        char_set = set()
        start = 0

        for i in range(len(s)):
            while s[i] in char_set:
                char_set.remove(s[start])
                start += 1
            char_set.add(s[i])
            count = max(count, i - start + 1)

        return count
        