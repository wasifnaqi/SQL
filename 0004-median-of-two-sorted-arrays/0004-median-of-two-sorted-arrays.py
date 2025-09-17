class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        ans = nums1 + nums2
        ans = sorted(ans)
        m = len(ans)//2
        if len(ans)%2 == 0:
            median = (ans[m] + ans[m-1])/2
        else:
            median = ans[m]
        return median

        