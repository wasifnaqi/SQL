class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            value = target - nums[i]
            for j in range(i+1,len(nums)):
                if nums[j] == value:
                    ans = [i,j]
                    ans = ans[::-1]
                    return ans               
        return []    
        