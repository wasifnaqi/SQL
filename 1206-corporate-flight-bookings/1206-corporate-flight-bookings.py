class Solution:
    def corpFlightBookings(self, bookings: List[List[int]], n: int) -> List[int]:
        answer = [0 for i in range(n+2)]
        for i in range(len(bookings)):
            flt1, flt2, seats = bookings[i]
            answer[flt1] += seats
            answer[flt2+1] -= seats            
        for j in range(1,n+2):                
            answer[j] += answer[j-1]
        return answer[1:-1]
                
        