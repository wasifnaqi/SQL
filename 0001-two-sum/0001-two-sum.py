class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        flag = False
        for i in range(len(nums)):
            value = target - nums[i]
            for j in range(len(nums)):
                if j == i:
                    break
                else:
                    if nums[j] == value:
                        ans = [i,j]
                        flag = True
                        ans = ans[::-1]
                        break
                if flag:
                    break
            if flag:
                break           
        return ans    
        