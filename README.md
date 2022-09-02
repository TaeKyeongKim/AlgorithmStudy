# AlgorithmStudy

## LeetCode 의 [Top Interview Questions](https://leetcode.com/explore/interview/card/top-interview-questions-easy/) 에 기재되어 있는 Easy 문제들을 풀어보자. 

### 문제 풀이 예시 
### Ex) LeetCode [#9](https://leetcode.com/problems/palindrome-number/): Palindrome
<details>
<summary> 고민 과 해결</summary>
- 어떻게 x 의 integer 값을 뒤집을까?
 
    1.0: x 값을 10 으로 나눈 나머지 값, 첫째 (1의) 자리 값을 저장한다. 
    
    2.0: 10 으로 x 값을 나눈다 
    
    3.0: x 가 0 이 될때까지 1,2 번 프로세스를 반복한다. 
    
- x 가 음수일때는 어떻게 처리할까?
    - 음수일경우 어느조합이 오든 Palindrome(회문) 조건이 성립하지 않음으로 false 를 반환하게 처리.

- String 으로 변환을 하지 않고 어떻게 [Int] 에 있는 값들을 하나의 integer 값으로 만들수 있을까?
    - map 을 사용해서 해결
        
        ex) digit = [1,2,1] 
        
         digit.reduce(0,{$0*10 + $1}) 
        
        → 0 * 10 + 1 = 1 
        
        → 1 * 10 + 2 = 12 
        
        → 12*10 + 1 = 121
        
</details>

---- 
## Array
<details>
<summary>1.0 Remove Duplicates from Sorted Array</summary>

 [문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/)

 ### 고민 과 해결

- 이문제는 2가지의 유형으로 접근했다.

- 1.0 중복된 요소를 삭제하고 그 배열의 크기를 리턴해준다. (문제가 원하는 방법이 아님)
> Set 을 사용해서 배열의 중복된 요소를 없앤뒤 다시 increment 순서로 sort 해준다. 
```swift 
func removeDeplicates(_ nums: inout [Int]) -> Int { 
  nums = Array(Set(nums).sort({$0 < $1}))
  return nums.count
}
```

- 2.0 하지만 문제 지문에서 다음과 같이 명시했듯이 `"Since it is impossible to change the length of the array in some languages"`, 어떤 언어에선 배열의 크기를 바꿀수없다. 따라서 "In-place" 방식을 사용하여 문제를 해결하라고 한다. 

`고민`: 어떻게 중복된요소를 배열의 크기를 유지하면서 걸러낼수있을까?

### 시도1
> 접근 방식: 배열을 순회하면서 다음 요소값과 값이 같다면 다음요소의 값을요소값의 range 외 값으로 설정해주고 마지막에 filter 해준다. 

> 결과: 연속해서 2개 이상의 요소가 같은 값이면 중복된값을 바꾸어 줄수 없음 -> ex) [1,1,1] -> [1,101,1] 

### 시도2

> 접근방식 
> - `pointer` 라는 변수로 순서대로 정렬되어있는 요소들의 마지막 인덱스를 가르킨다. -> 초기값을 1로 설정해두어 0번째 요소와 비교가능하게 설정.
> - 배열을 순회하면서 중복으로 나열되어 있는 값과 다른값이 나올경우 배열의 `pointer` 인덱스에 바뀐 값을 대입해준다. 
> - 결과적으로 중복된 요소일때는 pass, 다른요소일때는 pointer 를 사용해 배열의 앞부분부터 순서대로 채워준다. 

```swift 
func removeDeplicates(_ nums: inout [Int]) -> Int { 
   var pointer = 1 
   for i in 1..<nums.count { 
    if nums[i] != nums[i-1] { 
     nums[pointer] = nums[i]
     pointer += 1
    }
   }
  return pointer
}
```

<img width="507" alt="image" src="https://user-images.githubusercontent.com/36659877/187836546-a099bf1a-06bf-43e0-81f2-704524dd5cf7.png">
</details>

---- 

<details>
<summary> 2.0 Best Time to Buy and Sell Stock II </summary>

`고민`: Brute Force 방법 말고 어떻게 문제에 접근할수 있을까? 

`근거`: Stock 을 산 날부터 팔아서 profit 을 낼수 있는 모든 경우의 수를 계산 해야하기 때문에 time complexity 가 On^n 이 된다. 

### 시도 
> `접근방식1`: 배열을 순회하면서 각 날짜마다 최대의 profit 을 더해준다. 

> `결과`: 한 날짜의 최대 profit 을 주는 selling 날짜만 구하면 다른 날짜에 팔아서 생기는 profit 의 조합을 구할수 없게 된다. 밑에 그림을 보면 `valley(i)` 와 `peak(j)` 값만 계산해준것과 같다.  

> `접근방식2`: Net Profit 구하기. 주어진 배열의 stock price 값들을 가지고 나올수 있는 profit 의 합을 구하는 방식이다. 

<img width="685" alt="image" src="https://user-images.githubusercontent.com/36659877/188079868-3036dfc6-5ade-49a0-835f-3e9da37bbf43.png">

> `결과`: 성공.

```swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
       var profit = 0 
       for i in 1..<prices.count { 
         if price[i] > price[i-1] { 
           profit += price[i] - price[i-1]
         }
       } 
       return profit
    }
}
```

Time Complexity =  `O(n)`

Space Complexity = `O(1)`
</details>

----

