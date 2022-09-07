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

<details>
<summary>3.0 Rotate Array </summary>

[문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/646/)

`고민`: 오른쪽으로 요소를 옮길때 어떻게 다음 값을 저장해서 그 다음 인덱스에 대입해줄수 있을까? 

### 시도1
> 접근 방식: Extra Memory 를 사용해서 해결하는 방법
- 1.0 k 값의 range 는 0 <= k <= 10^5 이기 때문에 전체 배열의 크기와 나누어 떨어진 값을 구한다. (이 나머지 값은 오른쪽으로 shift 되어지는 횟수이다)

- 2.0 기존배열에 N 만큼 shift 되면 어떤 패턴을 갖는지 확인해본다. 
ex) Given : [1,2,3,4,5,6,7] , shift right by 3
-> [5,6,7,1,2,3,4], 예제배열의 패턴을 살펴보았을때 배열을 [5,6,7] 과 [1,2,3,4] 로 나눌수 있다. 

- 4.0 Nums 와 같은 크기를 가진 임시배열 `temp` 를 만들고 [5,6,7], [1,2,3,4] 를 차례대로 넣어줄수 있는 알고리즘을 생각해본다.
-> 오른쪽으로 3번 shift 하라는 k 값을 사용해 기존 nums 배열에서 [5,6,7] 을 빼내어 temps 에 넣어준다. 

- 5.0 나머지 [1,2,3,4] 의 값을 temp 에 넣어준뒤 nums 배열을 업데이트 시켜준다. 

> 결과: 

```swift

func rotateArray(_ nums: inout [Int], _ k: Int) { 
 //Shift 될 값을 계산 
 var offSet = k % nums.count 
 
 //nums 의 크기만큼 temp 배열생성 
 var temp = Array(repeating: 0, count: nums.count)
 
 //Temp 배열의 인덱스를 tracking 해줄 값
 var index = 0
 
 //nums 끝을 기준으로 offSet 값만큼 temp 에 넣어준다. 
 for i in (nums.count - offset)..<nums.count {
  temp[index] = nums[i] 
  index += 1
 }
 
 //nums 의 시작을 기준으로 offSet 값만큼 temp 에 넣어준다. 
 for j in 0..<(nums.count-offSet) { 
  temp[index] = nums[j]
  index += 1
 }
 
 //nums 업데이트
 for k in 0..<nums.count { 
  nums[k] = temp[k]
 }
 
}


//번외 LeftShift 일 경우
//Given [1,2,3,4,5,6,7], leftShift by 2 -> [3,4,5,6,7,1,2] 
//배열을 [3,4,5,6,7] 과 [1,2] 로 나눌수 있다. 
//temp 를 사용하여 [3,4,5,6,7], [1,2] 를 순서대로 대입할수 있게 로직을 구현한다. 

func leftRotateArray(_ nums: inout [Int], _ k: Int) {
 var offSet = k % nums.count 
 var temp = Array(reapting:0, count: nums.count) 
 var index = 0 
 
 for i in offSet..<nums.count { 
  temp[index] = nums[i]
  index += 1
 }
 
 for j in 0..<offSet { 
   temp[index] = nums[j]
   index += 1
 }
 
 for k in 0..<nums.count { 
  nums[k] = temp[k]
 }
 
}

```
> Left Shift 와 Right Shift 은 기준점은 시작점으로 할건지, 마지막 요소 로 할건지로 구분할수 있다. 

Time Complexity = O(n) 

Space Complexity = O(n)

### 시도2

> 접근 방식: Element 를 하나씩 Shift 하는 방법
 
- k 값의 range 는 0 <= k <= 10^5 이기 때문에 전체 배열의 크기와 나누어 떨어진 값을 구한다. (이 나머지 값은 오른쪽으로 shift 되어지는 횟수이다)
- Left Shift 인경우 현재 배열의 첫번째 요소를 저장해놓았다가 요소를 하나씩 왼쪽으로 옮긴후에 마지막 요소에 저장한 첫번째 값을 넣어주면된다. 이것을 k 번 반복하면되는데
 문제는 Right Shift 라는것이다. 
- `i + 1` 요소를 `i` 번째 인덱스에 넣는건 가능하지만 그 반대는 불가능하다. (i + 1 에 i 번째 요소가 중복해서 할당됨)  
- 따라서 nums 을 `reversed()` 시켜서 문제를 풀었다. 

> 결과: 
```swift 
func rotate(_ nums: inout [Int], _ k: Int) {
   var offSet = k % nums.count
 
   //Nums 배열을 뒤집어 준다. 
   nums = nums.reversed()
 
   while offSet > 0 { 
      let temp = nums.first! 
      for i in 0..<nums.count {
        nums[i] = nums[i+1]
        nums[nums.count-1] = temp
        offSet -= 1
      }
   {
                              
   //Nums 배열의 순서 원상복구
   nums = nums.reversed() 
} 
 
```
time Complexity = On*k
                              
space Complexity = O(1)

### 시도3

> 접근 방식: Juggling Alogrithm 을 사용. 

- 시도2 은 outer loop (k 번 실행되는 loop) 과 inner loop (각 요소마다 shift 하기위해 실해되는 loop) 때문에 `On*k` 의 시간복잡도를 가지게 됐다. 
- Juggling Alogrithm 은 배열의 길이 n, shift 되는 횟수 k 의 GCD (최대공약수) 를 구하여 outer loop 을 만든다. 
- Inner loop 에는 k 의 값만큼 떨어진 인덱스에 할당된 알맞은 배열의 요소을 할당시킨다. 
 
 
> 결과 
 
```swift 
 
func gcd(_ a: Int, _ b: Int) -> Int {
  if b == 0 {return a} 
  else{
   return gcd(b,a%b)
  }
}
 
func rotateArray(_ nums: inout [Int], _ k: Int) { 
 let offSet = k % nums.count
 
 for i in 0..<gcd(nums.count, offSet) { 
   let temp = nums[i]
   //j = index of array that is to be replaced
   var j = i 
   while true { 
     //d = pointing the next element to be shifted
     //nums.count - offSet is used for right shift, 
     //(j-offSet) % offSet can be used for left shift
     let d = (j+(nums.count-offSet)) % nums.count
     if d == j {break}
     nums[j] = nums[d]
     j = d
   }
   nums[j] = temp
 }
} 
```
 
ex1) k 값이 배열길이의 약수 일경우 


nums = [1,2,3,4,5,6], k = 2              
gcd = 2 (number of outer loop iteration)

@1st pass
`temp = 1`
 
|j|d|nums|
|---|---|------|
|0|4|[5,2,3,4,5,6]|
|4|2|[5,2,3,4,3,6]|
|2|0|[5,2,1,4,3,6]|
 

@2nd pass
`temp = 2`
 
|j|d|nums|
|---|---|------|
|1|5|[5,6,1,4,3,6]|
|5|3|[5,6,1,4,3,4]|
|3|1|[5,6,1,2,3,4]|
 
Time Complexity = O(N) 
                              
Space Complexity = O(1) 
                              
</details>

 <details>
  
 <summary> 4.0 Contains Duplicate </summary>
  
  
 `고민` = 시간 복잡도와 공간복잡도를 효율적으로 사용해서 문제를 풀어 봐야겠다. 
  
  ### 시도 
  
  > 접근 방식
  
  - 2중 for loop = 시간복잡도 On^2 (너무 김)
  
  - 디셔너리 = 시간복잡도 O(N), 이지만 Memory 를 많이 잡아먹음 
  
  - Set =  시간복잡도 O(N),  디셔너리 보다 적게 memory 사용. 
  
  > 결과 
  ```swift
  var set = Set<Int>()
  for num in nums {
    if set.contains(num) {return true}
    set.insert(num)
  }
  return false
  ```
  
 </details>
  
  
  <details>
   <summary> 5.0 singleNumber </summary> 
   
   > 접근방식 

   1.0 Using Dictionary 
   ```swift 
   func singleNumber(_ nums:[Int]) -> Int {
    var counter: [Int: Int] = [:]
     for num in nums {
       if let count = counter[num] {
         counter.updateValue(count + 1, forKey: num)
       }else {
         counter.updateValue(1, forKey: num)
       }
     }
     if let res = counter.first(where: {$0.value == 1}) {
       return res.key
     }
   return 0
   }
   ```
 
 2.0 Using Set 
   
 ```swift
 func singleNumber(_ nums:[Int]) -> Int {
   var set = Set<Int>()
    for num in nums {
      if set.contains(num) {
        set.remove(num)
      }else {
        set.insert(num)
      }
    }
   return set.first!
  }
 ```  
  </details>
  
<details> 
<summary> 6.0 Intersection of Two Arrays II </summary> 

### 시도1

> 접근방식 : Brute Force 

- 두배열의 요소를 순서대로 하나씩 비교하여 같은 값을 `res` 배열에 더해주는 방식으로 문제를 해결 했다. 

> 결과 

```swift 
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  var res: [Int] = [] 
  var outter = nums1.count >= nums2.count ? nums2: nums1
  var inner = nums1.count >= nums2.count ? nums1: nums2
  var m = outter.count
  while m > 0 {
    let lastElement = outter.last!
    if let matchedIndex = inner.firstIndex(where: {$0 == lastElement}) {
      res.append(lastElement)
      inner.remove(at: matchedIndex)
    }
    outter.removeLast()
    m -= 1
  } 
  return res
} 
```

Time Complexity = O(N*M)

Space Complexity = O(1) (idealy) 
 
 
 ### 시도2

> 접근방식 : Binary Search  

- 시도 1 에서 같은 요소를 찾는 방법으로 `firstIndex` 메소드를 사용했는데, binary search 를 사용해서 `O(nlogn + mlogn)` Time Complexity 를 개선 해보자.

> 결과 

```swift 

func binarySearch(_ arr: [Int], _ value: Int, _ low: Int, _ high: Int) -> Int {
  
  if low > high {return -1}
  
  let mid = (low + high) / 2
  if arr[mid] == value {
    return mid
  }
  else if arr[mid] > value {
    return binarySearch(arr, value, low, mid - 1)
  }
  else if arr[mid] < value {
    return binarySearch(arr, value, mid + 1, high)
  }
  return -1
}


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  var res: [Int] = [] 
  var outter = nums1.count >= nums2.count ? nums2: nums1
  var inner = nums1.count >= nums2.count ? nums1: nums2
  var m = outter.count
  while m > 0 {
    let lastElement = outter.last!
    inner = inner.sorted(by: <)
    let matchedIndex = binarySearch(inner, lastElement, 0, inner.count - 1)
    if matchedIndex >= 0 {
      res.append(lastElement)
      inner.remove(at: matchedIndex)
    }
    outter.removeLast()
    m -= 1
  }
  return res
} 
```

Time Complexity = `O(nlogn + mlogn)`

Space Complexity = O(1)
</details> 


<details> 
 <summary> 7.0 Plus One </summary> 
 
 [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/559/)
 
 `고민` = String 을 Integer 로 변환 해서 계산하면, Integer 의 limit을 넘을수가 있다. 따라서 배열 자체로 계산하는 방법을 고민해봤다.

  > 접근방식 
  
  - 주어진 digits 배열의 끝부터 1 을 더한 값이 9 를 넘으면 carry 를 1, 아니면 carry 를 0 으로 설정해주어 다음 요소를 계산하는 방식으로 접근했다. 
  
  - 마지막 요소부터 시작해서 첫번째 요소에 도달했을때의 값과 carry 로 넘어온 값을 더해 10 이 된다면 결과값을 담은 `res` 배열에 [0,1] 을 할당했다. 
  
  - 끝으로 `res` 배열을 reverse 해서 반환. 
  
  > 결과 


```swift
func plusOne(_ digits: [Int]) -> [Int] {
  var res: [Int] = []
  var carry = 1
  var index = digits.count - 1
  while index > -1 {
    let sum = digits[index] + carry
    if index == 0 && sum > 9 {
      res += [0,1]
    }else if sum > 9 {
      carry = 1
      res.append(0)
    }else {
      carry = 0
      res.append(sum)
    }
    index -= 1
  }
  return res.reversed()
}
```
Time Complexity = `O(n)`

Space Complexity = `O(n)`
 
</details> 

