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

 <details> 
  <summary> 8.0 Move Zeroes </summary> 
  
  [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/567/)
  
  > 고민 
  - Extra Memory 를 사용하지 않고 Inplace 방식으로 알고리즘을 어떻게 구현 할까?
  - O(N) 으로 구현 해보자 
  
  ### 시도 
  
  > 접근 방식 
  
  - 배열은 순회 할때 필요한 `i` 와 0 의 위치를 가르켜줄 `pointerToZero`, Two Pointer 를 사용한다. 
  - 배열을 순회 할때 `i` 번째 요소가 0 이 아닐시 다음 요소로 넘어 간다. 이로써 배열의 첫 0 을 i 번째 요소와 바꿀수 있게 된다. 
  
  > 결과 
  
  ```swift 
  func moveZeroes(_ nums: inout [Int]) {
   var pointerToZero = 0
   for i in 0..<nums.count {
     if nums[i] == 0 {continue}
     nums.swapAt(i, pointerToZero)
     pointerToZero += 1
   }
  }  
  ```
  Time Complexity = `O(n)`

  Space Complexity = `O(1)`
  
 </details>
 
  <details>
   <summary> 9.0 Two Sum </summary>
   
   [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/546/)
   
   > 고민 
   - 시간복잡도 `O(n^2)` 이하로 문제를 풀수 있을까? 
   
   ### 시도
   > 접근 방법
   - 딕셔너리를 사용해서 문제를 해결하려 한다. 
   - nums 를 순회 하면서 `Target - nums[i]` 을 디셔너리의 Key 로, value 는 i 값으로 할당한다. 
   - 디셔너리의 key 값에 nums[i] 의 요소가 있는지 확인한다. 이값을 x 라고 한다면, `Target - nums[i] = x`, `x + nums[i] = Target` 이 성사한다. 
   - i 와 저장되어 있는 딕셔너리의 value 값을 리턴 한다. 
   
   ```swift
   func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int:Int] = []
    
    for (index, value) in nums.enumerated() { 
     guard let matchedRemainingIndex = dict[value] else {
      dict.updateValue(index, forKey: target - value)
      continue
     }
     return [index, matchedRemainingIndex]
    }
   }
   ``` 
   
  Time Complexity = `O(n)`

  Space Complexity = `O(n)`
   
  </details>
  
  <details> 
   <summary> 10.0 Valid Sudoku </summary> 
   
   [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/769/) 
    
   > 고민 
   
   - `문제요약` : 이문제는 valid 한 스도쿠인것을 확인하기 위해서 row, column, square(3x3) 안에 있는 요소들이 1~9 까지 겹치는지 확인하는 문제였다.
   - 1.0 스도쿠 배열 순회 방법 
   - 2.0 어떤 자료구조로 중복 확인을 해줄까? 
   - 3.0 row, column, square 를 체크해야하는데 어떤 순서로 체크를 해줄까?
   - 4.0 square 체크를 어떤식으로 해야하나? 
   
   > 해결 
   
   - 1.0 스도쿠 배열 순회 방법 
    - 아래와 같이 스도쿠 배열이 주어지면 가장 쉽게 모든 배열의 요소를 순회할수 있는 가장 쉽고 직관적인 방법은 brute force 방법으로 진행하는것이였다. 
    - row, column 의 요소를 지정하기 위해 i 번째 row 를 기준으로 row 에 있는 요소들을 j 로 지정했다.
    
 <img width="887" alt="image" src="https://user-images.githubusercontent.com/36659877/189093056-877dde48-83be-4842-98fd-21bea9f9fe31.png">
   
   - 2.0 어떤 자료구조로 중복 확인을 해줄까?
     - swift 에는 array, set, dictionary 를 이용하여 중복된 요소가 있는지 확인하는 `contains` 메서드를 사용할수 있다. 
     - 이중 최적의 time complexity 를 갖는 자료구조로 선택했다. 
       - array: O(n) 
       - set: O(1) 
       - dictionary: O(1)
     - `set` 과 `dictionary` 는 `hashing` 을 사용해 O(1) 의 시간복잡도로 중복된 요소를 찾을수 있었다. 이중 `dictionary` 는 `key`, `value` 값을
     할당해주어야 하기 때문에 `set` 보다 메모리를 많이 사용하게 된다. 
     - 따라서 `set` 으로 중복확인을 진행했다.
     
  - 3.0 row, column, square 를 체크해야하는데 어떤 순서로 체크를 해줄까?
    - 생각해보니 row, column, square 를 체크하는 순서에 상관없이 중복요소가 있다면 false 를 반환해주면 된다.
    
  - 4.0 square 체크를 어떤식으로 해야하나? 
     - 순회하는 방법으로 brute force 를 사용하기 때문에 squareSet 에 들어갈 요소들을 innerloop 에서 지정 해주어야한다. 
     - 이때 innerloop 은 row 요소들을 순회하기 때문에 row 요소들을 3개 씩 나누어서 sqaureSet 에 할당해주는게 직관적이라 생각했다. 
     - 할당해주려는 과정에서 겪은 문제는 row 의 요소를 순회할때 i 번째 있는 row 에 있는 모든 요소들을 sqaureSet 에 넣어주어야 했었다. 
     
       - 기존에 생각했던 중복확인 방법  
     <img width="778" alt="image" src="https://user-images.githubusercontent.com/36659877/189089994-49088c2f-aa1b-4bd7-a0d9-90107f5aa1dc.png">
     
       -> 문제 : loop 에서 i번쨰 row 요소 전체를 순회 하기 때문에 squareSet 하나씩 검사하는것은 불가능.
     
     - row 에 있는 모든 요소들을 sqaureSet 에 집어 넣기 위해선 3개의 sqaureSet 이 필요했다. 
     따라서 `var squareSet = Array(repeating: Set<Character>(), count: (board.count/3))` 와 같이 squareSet 을 초기화 해주었고 i번째 row 를 순회 할때 3개씩 요소를 끊어서 sqaureSet 에 할당해주었다. 
     
    <img width="1100" alt="image" src="https://user-images.githubusercontent.com/36659877/189092565-2fe9c6ff-1c55-4cd1-89e2-dba07c3ad0db.png">
  
  
    > 결과 
   
```swift
    func isValidSudoku(_ board: [[Character]]) -> Bool {
  var itemCount = 0
  var squareSet = Array(repeating: Set<Character>(), count: (board.count/3))
  for i in 0..<board.count {
    var rowCheckSet: Set<Character> = Set<Character>()
    var colCheckSet: Set<Character> = Set<Character>()
    
    // Checking Squares, Rows, Column in sequence
    for j in 0..<board[i].count {
      let rowElement = board[i][j]
      let colElement = board[j][i]
      itemCount += 1
      let index = j/3
      
      //Checking Squares
      if checkDuplicate(val: rowElement, on: squareSet[index]) {
        squareSet[index].insert(rowElement)
      }else {
        print("detected Duplicates within the square!")
        return false
      }
      
      //Checking Rows
      if checkDuplicate(val: rowElement, on: rowCheckSet) {
        rowCheckSet.insert(rowElement)
      }else {
        print("detected Duplicates within the rows!")
        
        return false
      }
      
      //Checking Columns
      if checkDuplicate(val: colElement, on: colCheckSet) {
        colCheckSet.insert(colElement)
      }else {
        print("detected Duplicates within the columns!")
        return false
      }
    }
    //3개의 rows 씩 잘라서 진행.
    if itemCount % 27 == 0 {
      for i in 0..<squareSet.count{
        squareSet[i].removeAll()
      }
    }
    
    rowCheckSet.removeAll()
    colCheckSet.removeAll()
  }
  return true
  
}


func checkDuplicate(val: Character, on set: Set<Character>) -> Bool {
  if val == "." {return true}
  else if set.contains(val){
    return false
  }
  return true
}
```

Time Complexity = `O(n^2)`

Space Complexity = `O(n)`

  </details>
  
  <details> 
  <summary> 11.0  Rotate Image </summary> 
  
  [문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/770/)
  
  > 고민 
  - 어떤식으로 element 을 회전시에 배치해야할지 고민
  - n*n 의 배열을 어떻게 순회 해야할지 고민 
  - Element 회전 알고리즘 세우기
  
  > 해결 
  
  > 1.0 어떤식으로 element 을 회전시에 배치해야할지 고민
  전반적인 배열의 요소를 배치하는것은 아래의 그래프처럼 i 번째 row 를 순회 하면서 각각의 요소를 각변에 계산된 좌표에 값을 할당한다. 

<img width="932" alt="image" src="https://user-images.githubusercontent.com/36659877/189478006-1cfb6d97-d3d1-42de-a969-fb8075f2da9e.png">

  
  > 2.0 n*n 의 배열을 어떻게 순회 해야할지 고민
  - 일단 i 번째 row 를 순회 하고, j 번째 요소를 순회 할 outter loop 과 inner loop 이 필요하다. 
  - `outer loop`: n 개의 row 를 어떻게 순회 할까? 
    - 필요한 row 의 개수는 몇개 인가? 
      - 4x4 배열 일때를 가정해보자 
      - 아래 그림처럼 2개의 사각형으로 나눌수가 있다. 그리고 row 의 정보만으로 모든 요소를 돌면서 rotate 이 가능하다.
      
     <img width="883" alt="image" src="https://user-images.githubusercontent.com/36659877/189478013-6f081678-1499-42d1-8865-1c276a0b4e41.png">

      
      - n 이 4 일때, `i = 0,1` 위 그림처럼 두번의 row 를 순회 할것이다. 그렇다면 다른 케이스를 한번 생각해보고 outer loop 공식을 세워보자.
      
      |n|i|
      |---|-----|
      |1|(0)|
      |2|(0)|
      |3|(0,1)|
      |4|(0,1)|
      |5|(0,1)|
      |6|(0,1,2)|
      |10|(0,1,2,3,4)|
      
      - 위 테이블 n 과 i 값을 분석해보면 `i = 0..<N/2` 공식을 추론 할수 있었다. 
      - `inner loop`: 몇개의 요소를 각 row 에서 순회 해야할까? 
      - 두개의 사각형으로 나누면 외부의 사각형은 `0 부터 N-1` 까지의 indexing 이 필요하다. 
      - 내부 사각형에서는 외부사각형에서 회전한 값을 건들이지 말아야한다. `j = N-i-1` 을 inner loop 에 할당해주면 주어진 요구사항에 마추어 j 요소의 순회를 가능하게 할수있다.
      
   <img width="909" alt="image" src="https://user-images.githubusercontent.com/36659877/189477172-63115e8a-6b2a-4942-ac03-5a2c22233d0d.png">
 
  > 3.0 Element 회전 알고리즘 세우기
  - 1.0 에서 찾은 방법을 어떤 로직을 사용해서 구현해야할까? 
  - 일단 전체적인 알고리즘의 흐름은 아래와 같다. 
  - `ex) i = 0, j  = 0`
  <img width="904" alt="image" src="https://user-images.githubusercontent.com/36659877/189478459-9530b5fd-8732-405d-9295-67bec9855dd5.png">
  
  ```swift 
  //Top 에 있는 요소를 temp 에 저장 
  let temp = matrix[0][0]
  
  //Top 에 있는 요소에 할당 
  matrix[0][0] = matrix[3][0]
  
  //Left 에 있는 요소에 할당 
  matrix[3][0] = matrix[3][3]
  
  //Bottom 에 있는 요소에 할당 
  matrix[3][3] = matrix[0][3]
  
  //Right 에 있는 요소에 할당 
  matrix[0][3] = temp
  ```
  
  - 위 코드를 모든 i,j 의 값이 들어올때 rotate 될 자리의 index 를 계산해야하는데, 몇개의 예시를 만들어 패턴을 찾고 로직을 만들어보자 
  
  ```
  // i = 0, j = 0 
  //Top 에 있는 요소를 temp 에 저장 
  let temp = matrix[0][0]
  
  //Top 에 있는 요소에 할당 
  matrix[0][0] = matrix[3][0]
  
  //Left 에 있는 요소에 할당 
  matrix[3][0] = matrix[3][3]
  
  //Bottom 에 있는 요소에 할당 
  matrix[3][3] = matrix[0][3]
  
  //Right 에 있는 요소에 할당 
  matrix[0][3] = temp
  
  
  // i = 0, j = 1
  //Top 에 있는 요소를 temp 에 저장 
  let temp = matrix[0][1]
  
  //Top 에 있는 요소에 할당 
  matrix[0][1] = matrix[2][0]
  
  //Left 에 있는 요소에 할당 
  matrix[2][0] = matrix[3][2]
  
  //Bottom 에 있는 요소에 할당 
  matrix[3][2] = matrix[1][3]
  
  //Right 에 있는 요소에 할당 
  matrix[1][3] = temp


  //i = 0, j = 2 
  //Top 에 있는 요소에 할당 
  matrix[0][2] = matrix[1][0]
  
  //Left 에 있는 요소에 할당 
  matrix[1][0] = matrix[3][1]
  
  //Bottom 에 있는 요소에 할당 
  matrix[3][1] = matrix[2][3]
  
  //Right 에 있는 요소에 할당 
  matrix[2][3] = temp
  ```
  
  > 해결
  
  - 위 패턴을 각각 의 side 마다 분석하면 아래와 같은 로직으로 문제를 해결할수 있다. 
  
  ```swift 
  
func rotate(_ matrix: inout [[Int]]) {
  
  let N =  matrix.count
  
  for i in 0..<N/2 {
    
    for j in i..<N-1-i {
      //Store the First element in square
      let temp = matrix[i][j]
      
      //Allocate top Element
      matrix[i][j] = matrix[N-j-1][i]
      
      //Allocate Leftside Element
      matrix[N-j-1][i] = matrix[N-i-1][N-j-1]
      
      //Allocate bottom element
      matrix[N-i-1][N-j-1] = matrix[j][N-i-1]
      
      
      
      //Allocate rightside element
      matrix[j][N-i-1] = temp
      
    }
  }
  
}

```

Time complexity = `O(n^2)`

Space complexity = `O(n)`

  </details>
  
---

## String 

<details> 

<summary> 1.0 Reverse String </summary> 

[문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/879/) 

> 고민 
- reverse 를 사용하지 않고 문제를 해결할수 있는 방법이 있을까? 


> 해결 
- two Pointer 를 사용해서 문제를 해결 했다. 


### 시도 

- 배열의 첫번째 요소 부터 가르키는 포인터를 `pointer` 라고 불렀다. 
- 배열의 마지막 요소 부터 가르키는 포인터를 `index` 라고 불렀다. 
- while 문을 사용해서 문제를 해결하려고 시도 했다. 
   - 예시로 주어진 배열의 문장은 `["H","E","L","L","O"]` -> 길이가 5인 배열이였다. 
   - while 의 컨디션을 아래와 같이 주었고, 예시로주어진 배열은 해결할수 있었다. 
   ```swift 
   var pointer = 0 
   var index = arr.count - 1 
   
   while index != pointer { 
   
     arr.swapAt(index, pointer) 
     index -= 1
     pointer += 1
    }
   }
   ```
   - 하지만 배열의 크기가 홀수 일때 index 와 pointer 가 같아지는 시점이 없기 때문에 while 문 컨디션을 아래와 같이 수정해주었다. 
   
> 결과 

   ```swift 
   
   var pointer = 0 
   var index = arr.count - 1 
   
   while index >= pointer { 
   
     arr.swapAt(index, pointer) 
     index -= 1
     pointer += 1
    }
   }
   
   ```
 
 Time complexity = `O(logn)`
 
 Space complexity = `O(1)`
 
</details> 


<details> 

<summary> 2.0 Reverse Integer </summary> 

[문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/880/)

> 고민 
- 10 나눈 나머지 값을 어떻게 하면 알맞은 자리수에 할당할수 있을까? 


> 해결 

### 시도1 
- [String] 을 사용해서 1의 자리에서 부터 계산된 나머지값을 append 시켜준다음 joined 해준다. 

```swift 

func reverse(_ x: Int) -> Int {
  var val = abs(x)
  let sign = x > 0 ? 1:-1
  var digits:[String] = []
  
  while val != 0 { 
    let remainder = val % 10 
    val = val / 10 
    digits.append(String(remainder)!)
  }
  
  let reversedValue = signed * Int(digits.joined())!
}

```
 - 문제 : Extra memory 를 사용함. 
 
 
 ### 시도2
 
 - `reversedValue` 를 먼저 선언하고 iteration 마다 10 을 곱해주고 나머지 값을 더해주는 로직을 적용
 
 > 결과 
 
 ```swift 
 
 func reverse(_ x: Int) -> Int {
  var val = abs(x)
  let sign = x > 0 ? 1:-1
  var reversedValue = 0
  
  while val != 0 {
    let remainder = val % 10
    val = val / 10
    reversedValue = reversedValue * 10 + remainder
  }
  
  reversedValue *= sign
  if reversedValue >= Int32.max-1 || reversedValue <= Int32.min
  {return 0}
  
  return reversedValue
 } 
 
 ```
 
 Time complexity = `O(n)`
 
 Space complexity = `O(n)`

</details>

<details> 
 <summary> 3.0 First Unique Character in a String </summary> 
 
 [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/881/)
 
 > 고민 
 - 중복된 요소의 개수를 어떻게 count 할까? 
 
 > 해결
 - 딕셔너리를 이용해 문제해결 
 > 1.0 `s` 를 순회하여 dictionary 에 `key = letter` , `value = count` 를 할당.
 
 > 2.0 `s` 를 다시한번 순회하여 각 요소를 dictionary 의 key 값에 넣어 중복된 count 값을 비교한다.
 
 > 3.0 count 값이 1인 index 를 리턴 
  
 > 결과  
 
 ```swift 
 
 func firstUniqChar(_ s: String) -> Int {
  
  var dict:[Character:Int] = [:]
  
  for character in s {
    if dict[character] != nil, let count = dict[character] {
      dict.updateValue(count + 1, forKey: character)
    }else {
      dict.updateValue(1, forKey: character)
    }
  }
  
  for (index,character) in s.enumerated() {
    if dict[character] == 1 {
      return index
    }
  }
  return -1
}

```

Time Complexity = `O(n)`
Space Complexity = `O(n)`
 
</details>



<details> 
 <summary> 4.0 Valid Anagram </summary> 
 
 [문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/882/) 
 
 > 고민 
 - 어떻게 주어진 두개의 string 에서 각각의 character 일치하는지 알수 있을까? 
 
 
 > 해결 
 
 ### 시도1 
 
 - Set 을 이용해서 문제를 풀려고 했으나, 중복된 character 의 개수도 일치해야한다는것을 깨닫고 다른 방법을 찾아봤다. 
 
 
 ### 시도2 
 
 - Character 는 고유한 unicode 로 이루워져있다. 
 - 이 값을 사용해서 각 단어를 sort 해준다음 비교하면 각 string 을 구성하는 characters 가 일치하는지 알수 있지 않을까 해서 시도함. 
 
 > 결과 
 
 ```swift 
 func isAnagram(_ s: String, _ t: String) -> Bool {
  return s.sorted(by: {$0 < $1}) == t.sorted(by: {$0 < $1})
 }
 ```
 
 TimeComplexity = `O(NlogN)`
 
 SpaceComplexity = `O(1)`

</details>


<details> 
 <summary> 5.0 Valid Palindrome </summary> 
 
 [문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/883/) 
 
 > 고민 
 - 어떻게 알파벳 과 숫자를 필터링 해야하나?
 
 > 해결
 - `CharacterSet` 의 `alphanumerics` 을 사용해서 필터링 과정을 거쳐 알파벳 과 숫자를 필터링 해준다. 
 - 이때 주어진 스트링을 unicodeScalars 로 변환 시켜주어 필터링 해주어야한다. 
 - [참조](https://forums.swift.org/t/removing-characterset-characters-from-a-string-seems-hard/47935)
 
 > 결과 
 
 ```swift
 
 func isPalindrome(_ s: String) -> Bool {
  let result = String(s.unicodeScalars.filter({CharacterSet.alphanumerics.contains($0)})).map({$0.lowercased()})
  let reversed = result.reversed()
  return result.joined() == reversed.joined()
 }

 ```

Time Complexity = `O(n)`
Space Complexity = `O(1)`
 
</details> 

<details>

 <summary> 6.0  String to Integer (atoi) </summary> 
 
 [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/884/)
 
 > 고민 
 
 - `' '`, `'+'`, `'-'`, and `'.'` 값들을 어떻게 필터링 해줄까? 


> 해결 

- 1.0 문자열 앞에 `' '` 을 없애 주기 위해 `trimmingCharacters` 을 사용해서 whiteSpace 들을 제거했다. 
- 2.0 문자열 앞에 `'+'`, `'-'` 를 필터링해주기 위해 `prefix()` 메소드를 사용했다. 
- 3.0 나머지 문자열에서 제일 앞에 위치한 숫자만 뽑아내야한다. -> 모든숫자는 Ascii code 로 손쉽게 구별할수 있으므로 `48~57` 까지의 ascii value 만 꺼내서 계산해주었다. 

```swift
func myAtoi(_ s: String) -> Int {
  
  var removedWhiteSpace = s.trimmingCharacters(in: CharacterSet.whitespaces)

  var sign = 1
  var value = 0
  
  if removedWhiteSpace.hasPrefix("-"){
    sign = -1
    removedWhiteSpace.removeFirst()
  }
  else if removedWhiteSpace.hasPrefix("+"){
    sign = 1
    removedWhiteSpace.removeFirst()
  }
  
  for char in removedWhiteSpace {
    if char.asciiValue! >= 48 && char.asciiValue! <= 57 && value < Int32.max && value > Int32.min {
      value = value * 10 + Int(String(char))!
    }else {
      break
    }
  }
  
  var res = sign * value
  
  if res > Int32.max - 1 {
    res = Int(Int32.max)
  }
  else if res < Int32.min {
    res = Int(Int32.min)
  }
            
  return res
}

```

Time Complexity = `O(n)`

Space Complexity = `O(n)`

</details> 

<details>
 <summary> 7.0 strStr </summary> 
 
 [문제 링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/885/)
 
 > 고민 
 - needle 이 어떻게 haystack 안에 있는지 확인하고 일치하는 첫번쨰 인덱스 를 반환해줄까? 
 
 > 해결 
 - `haystack` 을 순회 하면서 `hayStack.firstIndex + i` 와 `(haystack.startIndex, offsetBy: needle.count - 1 + i)` start, end  인덱스를 계산해준다. 
 - 계산된 start, end 를 `hayStack[start...end] == needle` 인지 확인하고 맞으면 `i` 를 반환하는 로직을 구성해 문제를 해결했다. 
 
 > 결과 
 
 ```swift 
 func strStr(_ haystack: String, _ needle: String) -> Int {

  if haystack.count < needle.count {return -1}
  
  for i in 0...haystack.count - needle.count {
    let newStartIndex = haystack.index(haystack.startIndex, offsetBy: i)
    let newEndIndex = haystack.index(haystack.startIndex, offsetBy: needle.count - 1 + i)
    if haystack[newStartIndex...newEndIndex] == needle {
      return i
    }
  }

  return -1
 }
 ```
 
 Time complexity = `O(n)` 
 
 Space complexity = `O(1)` 
 

</details> 

<details> 
 <summary> 8.0 Longest Common Prefix </summary> 
 
 [문제링크](https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/887/) 
 
 > 해결 
 
 - swift foundation 에 있는 `commonPrefix` 메소드 를 사용하여 문제 해결 
 
 
 > 결과 
 
 ```swift
 func longestCommonPrefix(_ strs: [String]) -> String {
  var prefix = strs.first!
  for i in 1..<strs.count {
    prefix = prefix.commonPrefix(with: strs[i])
  }
  return prefix
 }
 ```
                          
 Time Complexity = `O(n)`
                          
 Space Complexity = `O(n)`
 
 </details>
 
 ---- 
 
## LinkedList

<details> 
<summary> 1.0 Delete Node in a Linked List </summary> 

> 고민 
- 주어진 LikedList  의 특정 node 를 지우면 되는데 함수의 input 은 linkedList 밖에 없어서 당황함 

> 해결 
- LikedList 와 특정 node 가 주어지는게 아니라 이 함수를 밖에서 사용했을때 함수에서 주어진 노드를 리스트에서 삭제하라는 뜻이였다. 
- 주어진 노드의 값은 그 다음 값을 가지고 있다. 
- 주어진 노드의 nextNode 는 `node.next.next` 를 가르키고 있는것이다. 
![image](https://user-images.githubusercontent.com/36659877/190289656-fdc88f7a-f970-4bbd-b7ee-b261fa44c342.png)

```swift
 func deleteNode(_ node: ListNode?) {
      node?.val = (node?.next!.val)!
      node?.next = node?.next?.next
    }
```

Time complexity = `O(1)` 

Space complexity = `O(1)`

</details>

<details> 
 <summary> 2.0 Remove Nth Node From End of List </summary>
 
 > 고민
 - 어떻게 linked list 의 마지막 부터 n 번째의 요소를 지울수 있을끼? 
 - 연결된 list 의 다음 노드를 어떻게 알아낼까? 
 - 어떻게 list 의 연결을 끊어줄까?
 
 > 해결 
 - 어떻게 linked list 의 마지막 부터 n 번째의 요소를 지울수 있을까?
 
 -> node 의 다음 요소가 nil 일때까지 순회 하며 `indexCnt` 를 기록해두었다.
 
 - 연결된 list 의 다음 노드를 어떻게 알아낼까? 
 
 -> class 로 작성된 list 는 head 의 주소를 하는 `curr`, `prev`, 두개의 포인터를 사용하여 현재 가르키고 있는 노드, 이전노드를 가르키고 있는 변수를 만들어주었다. 
 
 -> for loop 을 `indexCnt-n` 번까지 순회하며 prev 는 curr 노드를, curr 은 다음 노드를 가르키킬수 있도록 구현.
 
 - 어떻게 list 의 연결을 끊어줄까?
   -> 아래의 그림과 같이 이전 노드의 다음 노드를 현재노드의 다음 노드로 연결시켜주고, 현재 노드는 삭제되어야할 노드이기 때문에 next 값을 0 으로 만들어 주어 list 의 연결 을 끊는다. 
 <img width="673" alt="image" src="https://user-images.githubusercontent.com/36659877/190552944-2ca46155-8e82-4680-87fe-cea2d30b54d0.png">

   -> 제일 처음 요소를 삭제해야하는 test case 가 있었는데, `indexCnt == n` 일때 현재 head 를 가르키고 있는 curr 포인터의 다음 노드를 다음 노드로 설정한뒤 curr 를 반환해주면서 문제를 해결했다.
   
   > 결과 
   
   ```swift 
   func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  var indexCnt = 1
  var counter = head
  var curr = head
  var prev: ListNode?
  
  //list 의 개수가 몇개인지 확인
  while counter?.next != nil {
    counter = counter?.next
    indexCnt += 1
  }
  
  //indexCnt 와 n 값이 같다면 제일 첫번째 요소를 지운다는 뜻.
  if indexCnt == n {
    curr = curr?.next
    return curr
  }
  
  //prev, curr 포인터 이동
  for _ in 0..<indexCnt-n {
    prev = curr
    curr = curr?.next
    // print(curr?.val)
  }
  
  //prev 를 curr 다음 노드에 연결 한뒤 curr.next 를 끊어준다.
  prev?.next = curr?.next
  curr?.next = nil
  
  return head
  }
  
  ```
  Time complextiy = `O(n)`
  
  Space Complexity = `O(1)`
 
</details> 

<details> 
 <summary> 3.0 Reverse Linked List </summary> 
 
 > 고민 
 - 리스트를 순회 하면서 pointer 를 어떤식으로 활용하여 뒤집어진 list 형태를 만들수 있을까? 
 
 > 해결 
 - 3 pointers 를 이용하여 문제를 해결. 
 > - 뒤집어진 리스트를 기록할 Pointer = `reversedList` 
 > - 현재 노드를 가르키는 Pointer = `curr`
 > - 다음번째 노드를 가르키는 Pointer = `nextNode`
 
 - 리스트 뒤집기 알고리즘 
 - 현재 노드의 link 를 끊어 주고, 이전의 노드 를 next 로 설정해주며 문제를 해결. 
 > - 1.0 `nextNode` 의 메모리 주소를 `reversedList` 에 할당해주며 기존 `curr` 노드의 링크의 방향을 바꿈. 
 > - 2.0 `reversedList` 노드의 메모리 주소를 `curr` 노드로 업데이트 시킴. 
 > - 3.0 `curr` 노드의 메모리 주소를 `nextNode` 로 할당. 
 > - 4.0 `nextNode` 의 메모리 주소를 `curr.next` 주소로 할당시킴 
 > - 5.0 `curr` 노드가 nill 을 가르킬때까지 반복. 
 
 - 전체적인 포인터 진행 방향 및 처음 포인터들이 가르키고 있는 노드 주소
 <img width="1194" alt="image" src="https://user-images.githubusercontent.com/36659877/190885309-c3856be0-7025-4aac-a3b9-7be2e65dcdb8.png">

 - 포인터의 메모리 주소 업데이트 및 알고리즘 진행순서 도식화 
 <img width="952" alt="image" src="https://user-images.githubusercontent.com/36659877/190885382-9e0cc861-dfc0-440c-aa34-03e1c099ea04.png">

 
> 결과 

```swift 
func reverseList(_ head: ListNode?) -> ListNode? {
  //revseredList 는 초기로 Nill 의 주소 값을 가지고 있음.
  var reversedList: ListNode? = nil
  //curr 은 head 의 첫번쨰 노드를 가르키고 있음.
  var curr = head
  //nextNode 는 head 의 다음 노드를 가르킴.
  var nextNode = curr?.next
  
  while curr != nil {
    //curr 의 다음 요소의 주소 값을 temp 로 지정
    curr?.next = reversedList
    reversedList = curr
    curr = nextNode
    nextNode = curr?.next
  }
  
  return reversedList
}
``` 

Time complexity = `O(n)`

Space Complexity = `O(1)`

 
</details> 


<details> 
 <summary> 4.0 Merge Two Sorted Lists </summary> 
  
  > 고민 
  - `list1` 혹은 `list1` 의 값을 비교하는 중에 둘중의 하나의 값이 없을 경우에는 어떻게 해야하나? 
  - 두개의 리스트 의 비교를 시작할떄 하나가 비어있을경우에는 어떻게 하나? 
  
  
  > 해결 
  > - Recursion 방법으로 문제를 해결 했다.
  > - 리스트 둘중 하나가 비어있다면 다른 리스트 반환
  > - 두개의 리스트의 `val` 값을 비교 하여 `mergeTwoLists(_:, _:)` 를 호출 
  
  - 메서드 호출 순서
  <img width="1531" alt="image" src="https://user-images.githubusercontent.com/36659877/190960043-2e19ac66-1048-4c6b-b5b0-66663e2a0275.png">
  
  - 메서드 Call Stack 순서대로 반환되어 지는 값
  <img width="1646" alt="image" src="https://user-images.githubusercontent.com/36659877/190960150-66d985d5-5abd-44bf-8a6b-9932cbc4f112.png">

  - xcode Call stack when list1 = 1,2,4, list2 = 1,3,4
  
 <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/190960763-ac221a4e-bd2f-4722-a4c9-6bf0d05578d5.png" width="350" height="250"> 
   </p>
   
> 결과 

```swift 
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
 
  //리스트 둘중에 하나가 비어 있을경우
  guard let list1 = list1 else {
    return list2
  }
  guard let list2 = list2 else {
    return list1
  }

  //리스트의 next 값이 nil 이 될때까지 진행
  if list1.val < list2.val {
    list1.next = mergeTwoLists(list1.next, list2)
    return list1
  } else {
    list2.next = mergeTwoLists(list1, list2.next)
    return list2
  }
  
 }

```
Time complexity = `O(n+m)` where n, m refers to length of each list

Space complexity = `O(1)` 
  
</details> 

<details> 
 <summary> 5.0 Palindrome Linked List </summary> 
 
 > 고민 
 - 보통 배열이나 String 의 Palindrome(회문) 여부는 reverse 를 사용해서 원래 있던 값과 비교하는 식으로 구현해왔다. 하지만 문제에서 O(1) 의 Space Complexity 를 요구했기에 고민되는 부분이 많았다. 
 - reverse 말고 다른 방법은 없을까? 
 - reverse 를 어떻게 하면 extra memory 를 사용하지 않으면서 구현 할수 있을까? 
 
 > 해결 
 - reverse 말고 다른 방법은 없을까? (with Space complexity O(1))
   - list 의 개수를 센뒤에 마지막 headNode.next 값을 head 의 첫번째 node 로 연결시킨다. 그후 카운트된 리스트 개수만큼 무한히 연결된 list 를 순회하면서 요소가 같은지 체크한다.
 
   -> [1,2,4], [1,2,2,1] 같은 케이스는 통과하지만 [1,1,2,1] 같은 경우 성립하지 못했다. (리스트를 연결한다고 해도 리스트의 역순을 구현할순없었기 때문이다). 
 
   -> 실패 
   
 - reverse 를 어떻게 하면 extra memory 를 사용하지 않으면서 구현 할수 있을까? 
   - 첫번째 시도는 리스트 전체를 그냥 reverse 해봤지만 메모리 주소의 next 값이 바뀌면서 참조된 head 의 list 에 영향을 끼쳐 버렸다. 
   - 두번째 시도는 리스트 중간 까지의 포인트를 찾아서 `중간지점의 노드` 를 `reverse` 한뒤에 원래 headNode 의 값들과 비교를 하는 것이다. 
     - 중간지점을 찾는데 여러가지 생각해야할 점들이 있었다. 
     - case 1: 리스트가 비어있을경우 
     - case 2: 리스트가 홀수인경우 
     > `curr`, `inspector` two 포인터 를 사용해서 문제를 해결할수 있었다. 
 
     > `inspector` 는 각 iteration 마다 `다음 노드` 와 `2번째 다음 노드` 가 nil 인지 확인한다. 그리고 nil 이 아니라면 `inspector` 는 2개의 노드뒤 를 포인팅하게 되고, `curr` 은 다음 노드를 가르키게 된다. 
 
     > 만약 리스트 노드의 개수가 홀수 (3개 ~> [1,2,3]) 인경우엔 `curr.next` 인 [3] 노드를 반환하게 된다. 
 
     > [3] 을 reverse 해도 reversedList 의 다음 요소가 nil 일때까지만 original head 의 요소와 값을 비교할것이기 때문에 input 이 [1,2,1] 일 경우에도 이 알고리즘은 유효하게 된다.
     
![image](https://user-images.githubusercontent.com/36659877/191064360-89ba46c1-c99b-4643-bbbf-66a14bb32992.png)

 
 > 결과 
 
 ```swift 
 
 func isPalindrome(_ head: ListNode?) -> Bool {

  let midNode = getLastHalfList(head: head)
  var reversedMidNode = reverseList(midNode)
  var curr = head
  
  while reversedMidNode != nil {
    if curr?.val != reversedMidNode?.val {
      return false
    }
    reversedMidNode = reversedMidNode?.next
    curr = curr?.next
  }

  return true
}

 //pass firsthalf of list
 func getLastHalfList(head: ListNode?) -> ListNode? {

   var curr = head
   var inspector = head

   while inspector?.next != nil && inspector?.next?.next != nil {
     inspector = inspector?.next?.next
     curr = curr?.next
   }

   return curr?.next
 }

  func reverseList(_ head: ListNode?) -> ListNode? {
   //revseredList 는 초기로 Nill 의 주소 값을 가지고 있음.
   var revseredList: ListNode? = nil
   //curr 은 head 의 첫번쨰 노드를 가르키고 있음.
   var curr = head
   //nextNode 는 head 의 다음 노드를 가르킴.
   var nextNode = curr?.next

   while curr != nil {
     //curr 의 다음 요소의 주소 값을 temp 로 지정
     curr?.next = revseredList
     revseredList = curr
     curr = nextNode
     nextNode = curr?.next
   }

   return revseredList
 }
 
 ```
 
 Time Complexity = `O(n)`
 
 Space Complexity = `O(1)`  
 
 
</details> 

<details> 
 <summary> 5.0 Linked List Cycle </summary> 
 
 > 고민 
 - 어떻게 이미 방문한 노드를 체크 해줄수 있을까? 
 - node 들을 어떻게 비교해서 같은 노드인지 확인할수 있을까? 
 - 패턴으로 확인해야하나?
 - 주어진 제약사항을 사용해서 문제를 풀어볼까?
 
 > 해결
 - 어떻게 이미 방문한 노드를 체크 해줄수 있을까?
 
   -> 이미 방문한 노드를 체크하려면 extra memory 를 사용하여 저장해야하는데, space complexity O(1) 의 제약사항을 못 지키게된다. 
   
 - 패턴으로 확인해야하나?
 
   -> 이것또한 extra memory 필요
   
 - 주어진 제약사항을 이용해볼까? 
 
   -> 제약사항은 리스트의 길이가 `[0, 1e4]` 였다. 따라서 while loop 에서 노드의 개수를 세어 1e4 이상으로 개수가 세어진다면 true 를 반환하는 스크립트를 짜봤지만... 실패나 다름이 없었다.. 
   
 - node 들을 어떻게 비교해서 같은 노드인지 확인할수 있을까? 
   - Node 가 Equatable 이 아니고, unique 한 id 도 없어서 어떻게 같은 노드인지 확인할까 고민을 하던중 `===` 연산자 를 알게되었다.
   - `===` 는 `ObjectIdentifier` 를 사용하여 비교되는 대상들이 같은 메모리주소를 참조하고 있는지 확인해준다. 
   - 같은 노드인지 확인할 방법이 생겼으니, 아래 예시와 같이 만약 순환되고 있는 요소라면 two pointer 을 사용해서 아래와 같이 순환되고있는 리스트인지 확인할수있다. 
     - curr pointer 는 리스트의 노드를 차례대로 짝수 로 건너뛰는 inspector 의 노드와 비교를 하게된다. (inspector 는 리스트개수의 제약에 따라 몇개를 건너뛴 노드를 검사할건지 정해줄수있다)
   
   <img width="1452" alt="image" src="https://user-images.githubusercontent.com/36659877/191170661-40e88dee-5b30-4774-80aa-475dd65f50ee.png">

 > 결과 
 
 ```swift 
 func hasCycle(_ head: ListNode?) -> Bool {
  var curr = head
  var inspector = head?.next

  while inspector != nil {
    if curr === inspector {
      return true
    }
    curr = curr?.next
    inspector = inspector?.next?.next
  }
  
  return false
}
```

Time Complexity = `O(n)` where n = original length of list 

Space Complexity = `O(1)` 

</details> 
 
--- 
 ## Trees 
<details> 
 <summary> 1.0 Maximum Depth of Binary Tree </summary>
 
 > 고민 
 - `TreeNode` 의 `right`, `left` 중 둘다 nil 이 아닐시에 어떤 방향으로 search 해야하나? 
 
 > 해결 
 - Recursive 함수를 사용해서 문제를 해결함. 
 - `BaseCondition` = `right` , `left` 노드가 둘다 Nil 일시 현재 `count` 를 반환. 
 - 반복해서 함수를 부를때는, `right`, `left` 의 노드의 깊이가 깊은것을 사용하여 `count` 에 더해서 반환해준다. 
 
 > 결과 
 ```swift 
 
 func maxDepth(_ root: TreeNode?) -> Int {
  // guard var root = root else {return 0}
  let curr = root
  let leftNode = root?.left
  let rightNode = root?.right
  var cnt = curr == nil ? 0 : 1
  
  //Base case
  if leftNode == nil && rightNode == nil {
    return cnt
  } else {
    cnt += max(maxDepth(leftNode), maxDepth(rightNode))
    return cnt
  }
}

 ```
 
 Time Complexity = `O(n)`
 
 Space Complexity = `O(1)`
 
</details> 


<details> 
 <summary> 2.0 Validate Binary Search Tree </summary> 
 
 > 고민 
 - parent TreeNode 바로 밑에 있는 subtree 와의 BST validation 은 쉽게 구현했지만, tree 가 깊어지고 층이 생기면서 상위에 있는 tree node 와 하위에 있는 node 의 BST validation 을 진행하는 부분에서 어려움을 많이 겪었다.
 
 > 해결 
 - 1.0 상위 노드의 값과 비교하여 현재 노드가 유효한 BST 인지 확인해주기 위하여 `low`, `high` integer 타입의 범위를 할당했다. 
 - 2.0 `validateRange(TreeNode, Low, High)` 메서드를 사용하여 subtree node 와 방향에 따른 BST validation Range 값을 지정할수 있도록 해주었다. 
 - 3.0 밑의 그림과 같이 트리의 오른쪽 노드의 subtree 가 nil 이 될때까지 함수를 recursive 하게 호출하게된다. (오른쪽 subtree 의 유효성 검사를 마친뒤, 왼쪽 subtree 를 진행해주도록 구현했다.)
 
   > `initial value` 
     > - low & high = 0 
      
   > `BaseCase` 
      > - 현재 노드가 nil 일경우 `true` 반환. (subtree 가 없을시 유요한 BST 임)  
      > - BST Range 값에 현재 노드의 값이 벋어날경우 `false` 를 반환
      
   > `Recursive` 
      > - 오른쪽 subtree 검사뒤, 왼쪽 subtree 검사진행
      
<img width="1192" alt="image" src="https://user-images.githubusercontent.com/36659877/192187615-208cb2b0-26ce-45ff-8a1b-d3fba26b9ed8.png">


> 결과 

```swift 
func isValidBST(_ root: TreeNode?) -> Bool {
  return validateRange(root, high: nil, low: nil)
}


func validateRange(_ root: TreeNode?, high: Int?, low: Int?) -> Bool {
  print("Inspecting : \(root?.val), low = \(low), high = \(high)")
  guard let curr = root else {return true}
  // The current node's value must be between low and high.
  if let low = low, curr.val <= low {
    return false
  } else if let high = high, curr.val >= high {
    return false
  }
  return validateRange(curr.right, high: high , low: curr.val) && validateRange(curr.left, high: curr.val, low: low)
}
```

Time Complexity = `O(n)`

Space Complexity = `O(n)`

</details>

<details> 
 <summary> 3.0 Symmetric Tree </summary> 
 
 > 고민 
 - O(1) 의 Space Complexity 로 문제를 풀수 있을까 고민함. 
 
 > 해결 
 - Recursive 하게 문제를 해결하기위해 직관적으로 문제를 어떻게 해결해야할지 생각해봤다.
 - 1.0 주어진 root 의 left, right 값은 같아야한다. (아닐시 false)
 - 2.0 `left.left == right.right && left.right == right.left` 가 성립해야 symmetric 한 것을 알수있다. 
 
 - 위 전재로 아래와 같이 recursive 함수를 설계할수 있었다. 
 
 > Basecase
 
 1.0 시작 포인트에서 두 노드의 값이 nil 이라면 true 반환 (비교할것이 없기때문에 symmetic 함)
 
 2.0 시작 포인트에서 두노드의 값이 같지 않다면 false 반환
 
 3.0 두 노드의 subtnode 값이 같지 않다면 false 반환
 
 > Recursive
 
 `left.left == right.right && left.right == right.left` 를 비교해주기 위하여 두개의 nodeTree 를 매개변수로 받는 `validateValue(left: TreeNode?, right: TreeNode?) -> Bool` 를 작성하여 반복분을 실행. 

 
<img width="1402" alt="image" src="https://user-images.githubusercontent.com/36659877/192431352-3cbd2ad2-f143-4c7d-ae5f-d979e024a179.png">
 
 > 해결 
 
 ```swift 
 func isSymmetric(_ root: TreeNode?) -> Bool {
 //initial states
  return validateValue(left: root?.left, right: root?.right)
 }

 func validateValue(left: TreeNode?, right: TreeNode?) -> Bool {
  print("A = \(left?.val), B = \(right?.val)")
  
  //Basecase1 : 시작 포인트에서 두노드의 값이 nil 이라면 true 반환 (비교할것이 없기때문에 symmetic 함)
  if (left?.val == nil && right?.val == nil) {return true}
  //Basecase2 : 시작 포인트에서 두노드의 값이 같지 않다면 false 반환
  if (left?.val != right?.val) {return false}
  //Basecase3 : 두 노드의 subtnode 값이 같지 않다면 false 반환
  print("A.left = \(left?.left?.val), B.right = \(right?.right?.val)")
  print("A.right = \(left?.right?.val), B.left = \(right?.left?.val)")
  if (left?.left?.val != right?.right?.val) && (left?.right?.val) != (right?.left?.val) {
    return false
  }
  
  //Recursive
  return validateValue(left: left?.left, right: right?.right) && validateValue(left: left?.right, right: right?.left)
}
```
 Time Complexity = `O(n)`
 
 Space Complexity = `O(1)`
</details> 

<details> 
 <summary> 4.0 Binary Tree Level Order Traversal </summary>
 
 > 고민 
 - 어떻게 다음 level 로 넘어가야하는지 알수 있는지에 대해서 고민을 했다. 
 
 > 해결 
 - 처음엔 트리의 subtree 갯수를 카운팅하는 로직을 구상하여 다음 level 로 넘어갈지 정해줄까 생각했는데, 코드가 너무 복잡해져서 밑에 방법으로 문제를 해결했다. 
 - `Queue` 를 사용하여서 첫번째 노드부터 차례대로 Enqueue 를 한뒤에 이중 while 문을 사용하여 문제를 해결했다. 
   - 1.0 Queue 가 `empty` 될 때까지 outer loop 을 돌린다. 
   - 2.0 레벨을 표시하기위해 현재 queue 의 노드개수를 `cnt` 에 저장한다. (현재 level 의 노드 개수)
   - 3.0 innerLoop 에서 첫번째 노드를 에 연결되어 있는 `subNode(left,right)` 를 queue 에 enqueue 해주며 다음 level 의 노드 개수를 업데이트 해준다. 이때 저장된 `cnt` 를 -1 해주며 0 이 될때까지 진행한다. (여기서 `cnt` 는 현재 level 에 있는 node 의 개수를 의미한다.) 
   
   > 결과 
   
```swift 
func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        var queue: [TreeNode?] = [] 
       
        guard let curr = root else {return res}
        queue.append(curr)

        while (!queue.isEmpty) {
          var level: [Int] = []
          var count = queue.count - 1
          
            while (count >= 0) {
                if let node = queue.removeFirst() { 
                    level.append(node.val)
                    count -= 1
                    //enqueue next Nodes 
                    if let left = node.left {queue.append(left)}
                    if let right = node.right {queue.append(right)}
                }
            }
            res.append(level)   
        }
        return res
    }
```
   Time Complexity = `O(n)` 
   
   Space Complexity = `O(n)`
   
   
</details> 
   
<details> 
 <summary> 5.0 Convert Sorted Array to Binary Search Tree </summary>
 
 > 고민 
 - 왼쪽 / 오른쪽 subtree 를 어떤식으로 주어진 배열을 기반으로 형성해야할지 고민. 
 
 > 해결 
 - 시도 1: Non recursive method
   - 왼쪽 / 오른쪽 subtree 를 어떤식으로 주어진 배열을 기반으로 형성해야할지에 대한 고민 을 해결하기위해 주어진 배열의 개수 / 2, (중앙 요소) 를 기점으로 왼쪽/오른쪽 subtree 를 구성하려고 했다. 
   
   - 과정 : 
      - 1.0 왼쪽 subTree 를 주어진 배열의 가운데 요소전까지 만들어준다. (왼쪽, 오른쪽 subNode 를 거꾸로 채우며)
      - 2.0 최상위 노드를 완성된 subtree 위에 지정해주고, right subTree 의 시작점을 만들어주기위해 배열에서 요소를 하나 더빼와 right 에 지정해준다. 
      - 3.0 오른쪽 SubTree 는 남은 배열이 empty 가 될때까지 배열의 마지막 요소부터 빼와 right subtree 를 구성해준다. (배열은 오름차순이기 때문에 오른쪽 subtree 요소들을 구성해줄땐 마지막 요소부터 빼주었다.) 
      
   - 맞닥트린 문제: 
      - 1.0,3.0 순서에서 적은개수의 배열이 주어질경우에는 queue 를 사용하지 않아도 하나의 줄기로 Node 가 이어지기때문에 됐었지만, 배열이 길어지면 몇번째 node 의 left right 노드를 만들어줄것인지 순서를 정해야하기 때문에 queue 도 사용해야하고 코드가 너무 길어진다.
      - 2.0 순서에서 배열의 요소가 남아 있는지 항상 체크를 해주어야하기 때문에 코드에 조건문이 너무 많이 생긴다. 
   
  
 - 시도 2: Recursive method
     - 과정: 
       - 1.0 최상의 노드를 먼저 주어진 배열의 가운데요소로 생성해준다. 
       - 2.0 최상위 노드를 기점으로 left, right subtree 를 형성해준다. (recursive 하게 아래 그림 참조) 
       ![image](https://user-images.githubusercontent.com/36659877/193267279-907a74c7-4883-4ab0-82d5-473e765567bb.png)

 > 결과
  
  ```swift
  func sortedArrayToBST(nums: [Int]) -> TreeNode? {
  
    guard !nums.isEmpty else { return nil }

    let mid = nums.count / 2

    let treeNode = TreeNode(nums[mid])

    treeNode.left = sortedArrayToBST(nums: Array(nums[0..<mid]))
    treeNode.right = sortedArrayToBST(nums: Array(nums[mid + 1..<nums.count]))

  return treeNode
  }
 ```
 
 Time Complexity = `O(n)`
 
 Space Complexity = `O(n)` 

</details> 

----
## Sorting and Searching 

<details> 
 <summary> 1.0 Merge Sorted Array </summary> 
 
 > 고민 
 - 두 배열의 요소하나하나를 비교해서 만약 `nums2` 의 요소값이 더 작다면, `nums1` 을 어떻게 업데이트 해줘야할지 고민을 많이 했다. 
 
 > 해결 
 - Two pointer 를 사용해서 문제를 해결했다. 
 - `pointer1` 는 `nums1` 배열의 인덱스를 체크해주고, `pointer2` 는 `nums2` 의 인덱스를 체크하도록 구성했다. 
 - `While` 문을 사용했는데 `pointer1` 값이 `var pointer1Range = m` 보다 작고, `pointer2` 값이 `n` 값보다 작을시 계속 반복하라는 조건을 주었다.
 - `nums2` 의 요소값이 더 작다면, `pointer1` 인덱스에 `nums2[pointer2]` 값을 `insert` 해주어 오름순서대로 배치가 되도록 해주었고, 동시에 다음 요소를 가르켜 비교할수 있도록 `pointer2` 의 값을 +1, nums1 의 배열에 insert 되었으니 원래 `pointer1Range` 도 +1 을 해주어 기존에 `num1` 에 있던 요소를 `pointer1` 이 다 가르킬수 있도록 처리해주었다.
 - 이런식으로 처리를 해줄경우 만약 `nums1` 의 최대값이 `nums2` 의 최대값보다 한참 못미칠경우 아래와 같이 `nums2` 의 모든 요소가 비교되지 않고 while 문이 끝나 버리는 상황이 난다.
 
 <img width="979" alt="image" src="https://user-images.githubusercontent.com/36659877/193405201-dd76a367-651c-4c77-a991-3def4c45d4b3.png">
 
 - `nums2` 의 남은 값들 을 처리 해주고 `insert` 로 비교된 값들을 처리해주었기 때문에 남은 `0` 을 따로 처리해주어야하는 상황이 일어나 버렸다. 
 - `nums2` 의 남은 값들 을 처리 해주기: 배열의 `replaceSubrange(_ range: Range<Int> ,with: newElements)` 를 아래와 같이 사용해야 했다. 
 - 또한 이러한 경우는 오직 `pointer2` 가 `n` 까지 도달하지 못했을 경우에만 처리해주어야하기 때문에 while문 이후에 조건문을 따로 주어야했다. 
   - ex) nums1 = [1], nums2 = [] 일 경우, nums1 이 [] 으로 할당되는 상황이 일어남
 <img width="668" alt="image" src="https://user-images.githubusercontent.com/36659877/193405406-f9f5c7f4-aaf6-451a-8228-f5698ce83e9a.png">

 - 남은 `0`을 따로 처리: 기존에 주어졌던 배열 각각의 길이 `m+n` 을 사용해서 0이 포함된 `nums1` 을 업데이트 해주어야했다.
 
 > 결과
 
 ```swift
 func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pointer1 = 0 
        var pointer2 = 0
        var pointer1Range = m 

        while (pointer1 < pointer1Range) && (pointer2 < n)  {
          if nums1[pointer1] > nums2[pointer2] {
                nums1.insert(nums2[pointer2], at: pointer1)
                pointer2 += 1
                pointer1Range += 1
            } else {
                pointer1 += 1
            }                        
        }
        
        if pointer2 != n {
        nums1.replaceSubrange(pointer1..<nums1.count, with: Array(nums2[pointer2..<nums2.count]))       
        }
        
        nums1 = Array(nums1[0..<m+n])
    }
 ```
 
 Time Complexity = `O(n+m)` 
 
 Space Complexity = `O(n)`

 > Three Pointer 를 사용하여 문제해결방법 (무조건 Two Pointer 를 사용해서 문제를 해결하려고 했었는데, 왜 그랬는지 모르겠다...)
 
 - nums1 의 마지막 인덱스부터 nums1, nums2 의 마지막 요소를 비교하여 큰값을 먼저 nums1 의 마지막에 할당시켜주는 방식. 
 
 
 <img width="866" alt="image" src="https://user-images.githubusercontent.com/36659877/193406738-2ac60e7e-afc4-42a7-9781-4e99a50f681c.png">
 
 ```swift 
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var updatingPointer = m-m-1
    var nums1Pointer = m-1
    var nums2Pointer = n-1
    
    while updatingPointer >= 0, nums2Pointer >= 0 { 
      if nums1Pointer >= 0, nums1[nums1Pointer] > nums2[nums2Pointer] { 
        nums1[updatingPointer] = nums1[nums1Pointer]
        nums1Pointer -= 1
      }else {
        nums1[updatingPointer] = nums2[nums2Pointer]
        nums2Pointer -= 1
      }
      updatingPointer -= 1
    }
  
  }
 ```
</details> 


<details> 
 <summary> 2.0 First Bad Version </summary>

 > 고민
 - 문제를 이해하는데 어려움을 겪었다. input 이 5와, 4 일때, 1...5 까지의 integer 를 순회하며 첫번째로 `isBad(n) = true, (4 in this ex)` 인 숫자를 리턴하는 문제였다. 
 - 어떤식으로 순회하여 문제를 해결해야하는지 고민했다. 
 
 > 해결 
 - 첫번째 해결법으로는 요소한개한개를 검사하여 처음으로 `True` 가 나오는 값을 리턴해주었다. (하지만 숫자가 커지기 시작하면서 time limit 에 걸리고 만다)
 - 두번쨰 해결 방안으로는 이진탐색을 검색하여 문제를 풀어보려고했으나, recursion 을 사용해서 접근하려니 bad version 도 체크해주는과정과, 이진 검색 range 도 설정해 주는과정에서 머리가 멈춰버리고 말았다. 
 - 결국 답을 보고 문제를 해결했는데, 굉장히 간단한 방법으로 문제를 아래와 같이 해결할수 있었다. 
 - Left, Right, Mid pointer 를 사용하는데 `isBad(Mid)` 의 값이 True, 일때와 False 일때 Range(left, right) 를 재설정해주어 left 가 right pointer 보다 -1 적을때까지 while 문을 돌린다. 
 
 - #Scenario 1: mid pointer 의 요소가 불량인 버전이 아닐때
  - 주어진 n = 6 일때, [1,2,3,4,5,6] 요소를 검사하게되는데 `isBad(Mid) = false` 일때 생각해보자
  <img width="686" alt="image" src="https://user-images.githubusercontent.com/36659877/193440685-1ec52c3e-c480-425c-998a-71a2def942e4.png">
 
 - 1 에서 중간지점까지 불량이 없다는 뜻은 `중간지점의 + 1 요소`부터 불량인지 체크를 해주어야한다는 말이된다. 따라서 이진탐색 의 Range 를 [mid+1, right] 로 업데이트 해준다. 
  
 - #Scenario 1: mid pointer 의 요소가 불량인 버전일때 
  - 주어진 n = 6 일때, [1,2,3,4,5,6] 요소를 검사하게되는데 `isBad(Mid) = True` 일때 생각해보자
  <img width="649" alt="image" src="https://user-images.githubusercontent.com/36659877/193440776-bbe6f9c0-21b6-4ccf-8471-d959918e5e8b.png">
  
  - 중간 지점에서 불량이 나왔다는뜻은 그 이전에 나왔을수도있다는 뜻이된다. 따라서 새로운 이진탐색 의 range 를 [left, mid] 로 설정해준다. (불량 버전인 mid 를 포함하게 되는데, 이는 left pointer 가 +1 씩 왼쪽에서 오른쪽으로 탐색범위를 좁혀오기때문에 마지막으로 left pointer 가 right pointer 를 가르키게되면서 불량버전을 찾아낼수있게된다)
  
  
  > 결과 
  ```swift 
    func firstBadVersion(_ n: Int) -> Int {
      var left = 1
      var right = n
      while left < right {
        var mid = left + (right - left)/2 // n 값 이커지면 (right+left)/2 는 overflow 되기때문에, (right-left)/2 로 중간지점의 인덱스 계산뒤, 기준점 left 에 더해주도록 계산한다.
        if isBadVersion(mid) {
          var right = mid
        }else {
          var left = mid + 1
        }
      }
      return left 
    }
  ```

  Time Complexity = `O(logn)`
  
  Space Complexity = `O(1)`

</details>
 
---
 
 ## Dynamic Programming 
 
 - DP 는 `큰 문제` 를 `부분 문제` 로 나누고, `부분문제` 의 정답으로 `큰 문제` 의 해답을 찾아가는 알고리즘 설계법 이다. 
 - 이렇게 보면 `분할 정복` 문제와 비슷하다고 느끼겠지만, 해를 구하기 위해 쪼갠 `부분문제` 의 특성이 다르다. 
 - 분할 정복과 비교했을 때 동적 프로그래밍의 도드라지는 특성은 작게 쪼개진 `부분 문제` 가 중복돼서 나타난다는 것이다.
 - 분할 정복은 큰 문제 가 `유니크한 부분 문제` 로 나뉘지만 `동적 프로그래밍` 은 `부분 문제` 가 반복적으로 등장한다.
 - `큰 문제` 의 해는 `부분 문제` 의 조합으로 찾을 수 있으며 `문제의 해는 동일한 연산으로 수행` 되어야 한다.
 - [참조](https://kangworld.tistory.com/48)
 
 <details>
  <summary> 1.0 Climbing Stairs </summary>
  
  > 고민 
  - 어떤 반복적인 부분문제가 있는지 파악하기
  - 어떤 `부분 문제` 의 조합을 사용해야하나?

  > 해결
  - 어떤 반복적인 부분문제가 있는지 파악하기 & 어떤 조합으로 이루어져있나?
     - 계단을 오를때 1,혹은 2 칸씩 오를수 있다고 주어졌고, `n` 번째 계단을 올라 정상까지 도달하는 방법의 수를 구하는 것이였다.
     - 2개의 계단을 오르는 방법은 1칸씩x2 와 2칸을 동시에 오르는법: 2가지이다.
     - 3개의 계단을 오르는 방법은 1번째 계단에서부터 2칸을 오르는방법, 2번째 계단에서 1칸을 오르는 방법: 3가지이다.
     - 4개의 계단을 오르는 방법은 (2번째계단까지 오르는 방법 + 2칸을 한번에 가는법), (3번째 계단까지 오르는 방법 + 1칸을 한번에 가는법) : 5가지 이다.
     - `n번째` 계단을 오르는 방법은 `(An-2) + (An-1)` 가지 이다.
  - 위 점화식은 `피보나치 수열` 과 같다. 
  
  > 결과 
  
  > 시도 1 (TimeLimit Exceeds)
  
  - `문제의 해는 동일한 연산으로 수행` 되기때문에 아래와 같이 Recursive 하게 문제를 풀면 중복된 계산을 계속 반복하기 때문에 시간이 오래걸린다.
  
  ```swift
  func climbStairs(_ n: Int) -> Int {
        if n == 1 {return 1}
        if n == 2 {return 2}
        return climbStairs(n-1) + climbStairs(n-2)
  }
  ```
  
  > 시도 2 (Memoization) 
  
  - 중복된 계산을 피하고자 이전에 구한 "부문 문제"의 해를 메모리에 저장해두는 방법으로 풀어봤다.
  
  ```swift
  func climbStairs(_ n: Int) -> Int {
       var steps: [Int] = [0,1,2] 
     
       if n > 2 {
          for i in 3...n{
             steps.append(steps[i-1] + steps[i-2]) 
          }
       }
    return steps[n]
  }
  ```
  
  Time Complexity = `O(n)`
  
  Space Complextiy = `O(n)`
  
  
 </details>
 
 <details> 
  <summary> 2.0 Best Time to Buy and Sell Stock </summary>
  
  > 고민
  - 배열의 값을 그래프로 그려보면 peak 가 생기고 valley 가 생기는데, valley 에서 peak 으로 올라가는 값이 profit 이 된다는 생각을 했다. 
  - 배열을 순회하면서 valley 에서 peak 으로 올라가는 값중 가장 큰수를 리턴 하면 될것이라는 생각을 했지만, [4,2,7,3,9] 인경우 [2,7] = 5, [3,9] = 6 이지만, [2,9] = 7 의 조합도 가능하기 때문에 다른 접근 방법으로 문제를 풀어야했다. 
  - `dp` 문제로 어떻게 접근해야하는지 많이 고민했지만 도저히 다른 방법이 떠오르지 않아 답을 보고 문제를 풀었다.
  
  > 해결 
  - DP 는 작은 문제의 답을 구하여 큰 문제를 푸는 방법인데 아래와같은 접근 방식으로 문제를 해결했다. 
  - 배열을 순회 해가면서 이전날보다 작은 값을 `currentStock` 에 저장한다. 
  - 배열을 순회 하며 현재 스톡값과 저장된 `currentStock` 을 빼주어 `만약 오늘 스톡을 판다면 얼마의 profit 이 생기는지 = profitInspector` 에 저장한다. 
  - `maxiumProfit` 이라는 값을 0 으로 초기화한뒤, 만약 `profitInspector` 보다 값이 작다면 `maxiumProfit` 을 현재의 profitInspector 으로 업데이트 해준다. 
  - 이 DP 문제는 하루하루 스톡을 팔았을 경우의 값을 계산하여 현재 `maxiumProfit` 과 비교하여 업데이트 해주는 작은 문제의 답을 해결해서 `가장 높은 profit` 을 구하는 구하는 문제였다.
  
  
  > 결과 
  
  ```swift 
  func maxProfit(_ prices: [Int]) -> Int {
     var currentStock = Int.max 
     var maxProfit = 0
     var profitInspector = 0 
   
     for i in 0..<prices.count {
       if prices[i] < currentStock {
         currentStock = prices[i]
       }
       profitInspector = prices[i] - currentStock
       if maxProfit < profitInspector {
         maxProfit = profitInspector
       }
     }
     return maxProfit
  }
  ```
  
  Time complexity = `O(n)`
                                     
  Space complexity = `O(1)`

 </details>
 
 <details>
   <summary> 3.0 Maximum Subarray </summary>
   
   > 고민 
   - 어떤 `Subproblem` 으로 나눌수있을까?
   - `O(n)` 안에 풀기
   
   > 해결 
   - 이문제를 해결하기 위한 생각의 흐름은 "어떤 `Subproblem` 으로 나눌수있을까?" 에서 부터 시작되었다. 
   - 1.0 현재 내가 가지고 있는 `SubArray` 의 합이 다음 subarray 의 합보다 작은지 확인하다보면 문제가 해결되지않을까?
   - 2.0 `SubArray` 의 크기는 `0~nums.count` 이다. 
   - 3.0 어떻게 개수를 지정해줄수 있을까? 
       - 어떻게 optimal 한 개수인지 알수있고, 그 position 은 어떻게 알까? 
       
   -> 처음 1개와 그 다음수를 비교해서 다음수가 더클때 position 을 그 다음 요소로 옮기면되지 않을까? 
  
   -> 처음 1개가 아니라, 시작이되는 `SubArray` 부터의 `Sum` 을 그 다음요소랑 비교하면 되지 않을까? 
  
   -> 만약 그 다음 요소가 이전의 `sum` 보다 크면 새로운 기준이되고, 그 기준부터 `Sum` 을 구하면되지 않을까? 
  
   -> 문제의 제목은 마치 SubArray 를 찾는 것 같은데, 함수는 `Sum: Int` 을 반환하고 있다. 그럼 `Sum` 을 저장해 두었다가 주어진 배열에서 나올수 있는 최대 수를 구하면되지 않나? 
   
   - 문제는 아래와 같이 2가지의 큰 문제로 나뉜다. 
   
   - Scenario 1 : `Σ nums[StartingPointer...Counter]` > `nums[Counter+1]`
      - `StartPointer` 는 어떤요소부터 더해줄것인지에 대한 기준점이 된다. 따라서 `Counter` 가 증가할때마다 `StartPointer` 가 같을시 `Σ nums[StartingPointer...Counter]` 값과 `nums[Counter+1]` 을 비교하여 `nums[Counter+1]` 가 이전 Sum 보다 작을시, 더해주어 `maxSum` 과 값을 비교한다. 
   이때 `maxSum` 보다 값이 크면 `maxSum` 을 업데이트 해주게 된다. 
   
   <img width="1158" alt="image" src="https://user-images.githubusercontent.com/36659877/193760434-64cea8e3-3206-47a2-b4e5-a199156db930.png">
   
   - Scenario 2 :`Σ nums[StartingPointer...Counter]` < `nums[Counter+1]`
      - 이전의 Sum 이 다음 요소보다 `작다면`, 다음 값을 새로운 기준으로 해줘야할지 생각해봐야한다. 
      - 만일, `이전의 합과 다음요소의 합` > `다음요소의 값` 일때, 기준(StartPointer)을 업데이트 해줄필요가 없게된다.
      - 마지막으로 `이전의 합과 다음요소의 합` 과 현재 기록되어있는 `maxSum` 을 비교해서 업데이트 해주면 된다. 
      
<img width="1118" alt="image" src="https://user-images.githubusercontent.com/36659877/193763548-5b2b43a0-f31f-4c6c-b8b2-54c853da69c7.png">


   - 처음엔 `이전의 요소들의 합` 을 구할때 `reduce` 고차함수를 사용했으나, `O(n^2)` 시간 복잡도 가 형성되어 패스를 하지 못했다. 
   - 따라서 `curr` 이란 변수를 이용하여 값을 계속 더해주는식으로 문제를 해결했다. 
   
   ```swift 
    func maxSubArray(_ nums: [Int]) -> Int {
  
  var cnt = 0
  var startPointer = 0
  var maxSum = nums[cnt]
  var curr = nums[cnt]
  
  while cnt < nums.count-1 {
    //만약 다음값이 더크다면 sp 업데이트
    if curr < (nums[cnt+1]) {
      startPointer = cnt+1
       curr = max(curr+nums[startPointer],nums[startPointer])
    } else {
      curr += nums[cnt+1]
    }
    
    if curr > maxSum {
      maxSum = curr
    }
    cnt += 1
  }
  
  return maxSum
  }
  ```
  
  - Time complexity: `O(n)`
 
  - Space complexity: `O(1)`
  
 </details>
 
 <details> 
   <summary> 4.0 House Robber </summary>
 
   > 고민 
   - 이문제는 도저히 풀수가 없어서 [여기를](https://www.youtube.com/watch?v=73r3KWiEvyk) 참조해서 문제를 풀었다. 
   
   > 해결 
   - 엄청나게 고민했는데 생각보다 간단히 아래와 같이 풀수 있었다. 
   - rob1 = 0 , rob2 = 0 이라는 초기값을 할당한다. 
   - 배열을 순회하며, `max(새로운 요소+rob1, rob2)` 값을 찾아내어 만약 `새로운 요소+rob1` (새롭게 터는 집) 이 이전값 `rob2` 보다 크다면 `temp` 값을 업데이트 해준다. 
   - rob1 과 rob2 의 값을 바꾼다. 
   - 이를 마지막 요소까지 반복.
   - 최종적으로 rob2 에 가장 많이 훔칠수 있는양의 값이 저장된다. 
   
   > 결과 
   
   ```swift 
   func rob(_ nums:[Int]) -> Int{ 
     var rob1 = 0 
     var rob2 = 0 
     
      for num in nums { 
        var temp = max(rob1 + num, rob2) 
        rob1 = rob2 
        rob2 = temp
      }
      
     return rob2
   }
   ```
   
   Time Complexity = `O(n)`
   
   Space Complexity = `O(1)`
  
 </details>
 
 ----
 
 ## Design
 
 <details> 
   <summary> 1.0 Shuffle an Array </summary> 
   
   > 고민 
   - `shuffle` 을 어떻게 구현할까
   
   > 해결 
   - `Stride` 를 사용해 아래와 같이 문제를 해결 
   
   > 결과 
   
   ```swift 
   func shuffled(_ nums:[Int] ) -> [Int] {
     var copy = nums
     for i in stride(from: nums.count-1, through: 1, by: -1){
       let index = Int.random(in: 0...i)
       if index != i {
         copy.swapAt(i, index)
       }
     }
     return copy
   }
   ```
  Time Complexity = `O(n)`
   
  Space Complexity = `O(1)`
  
  
 </details>
 
 <details> 
   <summary> 2.0 Min Stack </summary> 
  
  > 고민 
  - 어떻게 `minium` 값을 유지할수 있을까? 
  
  > 해결 
  - `[(element,min)]` 을 이용하여 현재 `push` 될때의 Minimum 값을 같이 저장한다. 
  
  > 결과 
  
  ```swift 
  class MinStack {
  
     private var stack: [(element:Int, min:Int)] = []

     init() {}

     func push(_ val: Int) {
         if stack.isEmpty { 
           stack.append((val,val)) //첫번째 min은 val 가됨.
         }else{
           stack.append((val,min(val,getMin())))    
         }
     }

     func pop() {
       _ = stack.popLast()
     }

     func top() -> Int {
       return stack.last!.element
     }

     func getMin() -> Int {
       return stack.last!.min
     }
    
   }
  
  ```
  
  Time Complexity = `O(n)`
   
  Space Complexity = `O(1)`
  </details>

---- 

## Math 

<details>
  <summary> 1.0 FizzBuzz </summary> 
  
  > 고민 
  - 3,5 의 공배수와, 각각의 배수일 때 만들어야하는 String 조합이 다른것을 어떤방법으로 표현해줄까? 
  
  > 해결 
  - `%` mod operator 를 사용해서 문제해결 
  - `Enum associated type` 을 사용해서 팩토리를 만들고 문제를 해결 
  
  > 결과 
  
  ```swift 
  enum FizzBuzz {
  case compute (Int)
  
  var string:String {
    switch self {
    case .compute(let num):
      if num % 3 == 0 && num % 5 == 0 {
        return "FizzBuzz"
      }else if num % 5 == 0 {
        return "Buzz"
      }else if num % 3 == 0 {
        return "Fizz"
      }else{
        return "\(num)"
      }
    }
  }
}

func fizzBuzz(_ n: Int) -> [String] {
  
  var res: [String] = []
  for i in 1...n {
    let fizzbuzz: FizzBuzz = .compute(i)
    res.append(fizzbuzz.string)
  }
  return res
}
```

Time Complexity = `O(n)`
   
Space Complexity = `O(n)`

</details>

<details> 
 <summary> 2.0 Count primes </summary> 
 
 > 고민 
  - 소수 판별법 
  - [에라토스테네스의 체 구현하기](https://loosie.tistory.com/267)

 > 해결 
 - 소수의 판별은 2,3,5,7 의 수로 나누어 떨어지지 않는 수 이다.
 - 에라토스테네스의 체 는 `2,3,5,7` 의 배수 를 제외한 하면 해당수까지의 소수가 몇개 있는지 알수 있다. 
 
 > 결과 
 
 ```swift 
 func countPrimes(_ n: Int) -> Int {
   var divisor = 2
   var cnt = 0 
   
   var primes = Array(repeating: true, count: n)

   if n < 2 {return cnt} 
           
     //Outer loop to go through 2,5,7,9..      
     while divisor * divisor < n { 
        if primes[divisor] == true { 
 
           var i = divisor
 
           while i*divisor < n {
             primes[i*divisor] = false
             i += 1                 
           }
            
         }
        
        divisor += 1
     } 
     
  for i in 2..<n {
    cnt += primes[i] == true ? 1 : 0
  }
  
  return cnt       
 } 
 ```
 
 Time Complexity = `O(n)` (원래 에라토스테네스의 체 알고리즘은 `O(log(logn))` 의 시간 복잡도를 가지고 있음.
   
 Space Complexity = `O(n)`


</details>


<details> 
 <summary> 3.0 Power of Three </summary> 
 
 > Intuition
<!-- Describe your first thoughts on how to solve this problem. -->
We can get the logarithms form with base of 3 by the following equation. 

![image.png](https://assets.leetcode.com/users/images/f8ff1393-1fda-4b43-adad-1c90ad271209_1665232671.988392.png)

Then I would compute power of that exponent on base 3 to see if the that is equal to n

![image.png](https://assets.leetcode.com/users/images/ae049365-f93f-421e-b698-9c73409e1024_1665232791.5429022.png)

In short,
log3(n) = log10(n)/log10(3), 
Check if n == 3^log3(n)

> Code
```
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
      if n <= 0 {return false}
      var r = (log(Double(n))/log(3.0)).rounded()
      return n == Int(pow(3, r))
    }
}
```

> Complexity
- Time complexity: `O(1)`
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(1)`
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

</details> 

<details> 
 <summary> 4.0 Romans to Integer </summary> 
  
  > 고민 
  - 어떤 단위로 단어를 끊어서 무슨값인지 표현해줄까?
  - 단어를 끊어서 판별하는 방법외 다른 방법이 있을까?
   
  > 해결 
  - 시도 1
     - Given `s = MCMXCIV` 
     - M, CM, MC, MC, XC, CI, IV 대로 2개씩 끊어서 해당 문자에 등록된 값이 있다면 아래와 같이 처리. 
     - C -> CM 이 있다면, C 에서 100 을 더해주고, CM 에서 900 - 100 을 해준 800 을 더해주어 1000-100 과 같은 값으로 처리되도록 구현. 
     - 이때 Swift string 은 subscript 을 사용할때 `String.index` 를 사용해야하기 때문에, 단어 하나를 `word` 라는 변수에 더해주고 현재 끝의 인덱스와 끝-1 인덱스를 따로 생성해준다. 
     - 또한 `enum` 으로 각 case 마다 할당되는 값을 지정해준다.
     
```swift 
     enum romans: String {
        case I
        case V
        case X
        case L
        case C
        case D
        case M
        case IV
        case XL
        case CD
        case IX
        case XC
        case CM

        var value: Int {
          switch self {
          case .I:
            return 1
          case .V:
            return 5
          case .X:
            return 10
          case .L:
            return 50
          case .C:
            return 100
          case .D:
            return 500
          case .M:
            return 1000
          case .IV:
          return 3
          case .XL:
            return 30
          case .CD:
            return 300
          case .IX:
            return 8
          case .XC:
            return 80
          case .CM:
            return 800
          }
          return 0
        }
      }

      func romanToInt(_ s: String) -> Int {
        var word: String = ""
        var res = 0

        for string in s {
        word += String(string)
          if word.count > 1 {
            let endIndex = word.index(before: word.endIndex)
            let lastWordIndex = word.index(endIndex, offsetBy: -1)
            let lastTwoWords = String(word[lastWordIndex...endIndex]) //Retrieve lastTwoWords
            if let value = romans(rawValue: String(lastTwoWords))?.value {
              res += value
              continue
            }
          }
          res += romans(rawValue: String(string))!.value
        }
        return res 
        }
```
  
- 시도2 : 앞단어의 값을 확인하여, 현재 값보다 클시 빼주면서 구현
  - Given `s = MCMXCIV`
  - 만약 i+1 번째 단어의 값이 i 번째 단어의 값보다 클시, 이는 1 < 5, 100 < 1000 등의 케이스로 나눌수 있음.
  - i 번째는 각 자리수를 뜻하는데, 만약 i+1 번째 단어의 값이 크다면 현재값을 sum 값에서 빼준다음, i+1 값을 더해주며 처리한다. 
  - 이방법은 String.index 를 생성할 필요가 없으며, enum 의 case 또한 I, V, X, L, C, D, M 외의 다른 값을 처리해줄 필요가 없어진다. 
     
```swift 
     enum romans2: String {
         case I
         case V
         case X
         case L
         case C
         case D
         case M

         var value: Int {
           switch self {
           case .I:
             return 1
           case .V:
             return 5
           case .X:
             return 10
           case .L:
             return 50
           case .C:
             return 100
           case .D:
             return 500
           case .M:
             return 1000
           }
         }
       }

     func romanToInt(_ s: String) -> Int {
         var res = 0
         let arr = Array(s)

         for i in 0..<arr.count {
           let val = romans2(rawValue: String(arr[i]))!.value
           if i+1 < arr.count, val < romans2(rawValue: String(arr[i+1]))!.value {
             res -= val
           }else {
             res += val
           }
         }
         return res 
      }
   ``` 
   
   > Complexity
- Time complexity: `O(n)`
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(1)`

</details>
 
 ---- 
 
 ## Others
 
 <details> 
  <summary> 1.0 Number of 1 Bits </summary>
  
  > 고민 
  - 주어진 input 의 형태가 binary 로 주어지는건가?
  - 문제를 읽었을때는 binary 형태로 주어지는 줄알았는데, decimal 형태의 Int 값으로 값이 들어옴.
  
  > 해결 
  - 주어진 decimal 값을 binary 형태로 바꾸는 과정에 나머지 값이 1일때 cnt+1 을 해주어 문제해결.
  
  > 결과 
  
  ```swift 
  func hammingWeight(_ n: Int) -> Int {
    var cnt = 0
    var val = n
  
    while val > 0 {
      if val % 2 == 1 {
        cnt += 1
      }
      val = val / 2
    }
  return cnt
  }
  ```
  
  - Time complexity: `O(n)`
  
  - Space complexity: `O(1)`
  
 </details>
 
 <details> 
  <summary> 2.0 Hamming Distance </summary> 
  
  > 고민 
  - bit-wise operator 를 사용할지 말지 고민..
  
  > 해결 
  - bit-wise operator 를 사용하는것과 안하는것에 차이가 없음. (시간복잡도, 공간복잡도 wise) 
  - 사람이 생각하는 decimal to binary 방법 `n/2` 를 사용하여 문제를 해결. (shift operator 사용가능)
  
  > 결과 
  ```swift 
  func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var cnt = 0 
        var val1 = x 
        var val2 = y
        while val1 != 0 || val2 != 0 {
            if val1 % 2 != val2 % 2 {
                cnt += 1
            }
            val1 = val1 / 2
            val2 = val2 / 2
        }
        return cnt
    }
  ```
  
  - Time complexity: `O(n)`
  
  - Space complexity: `O(1)`
  
  
 </details> 
 
 <details> 
  <summary> 3.0 Reverse Bits </summary> 

> 고민 
- Bit-wise operator 를 사용하여 문제를 해결 하기

> 해결 

- Bitwise Left and Right Shift Operators
The bitwise left shift operator (<<) and bitwise right shift operator (>>) move all bits in a number to the left or the right by a certain number of places, according to the rules defined below.

- Bitwise left and right shifts have the effect of multiplying or dividing an integer by a factor of two. Shifting an integer’s bits to the left by one position doubles its value, whereas shifting it to the right by one position halves its value.


- 32 bit unsigned integer 의 bit 을 뒤집어 버려야함. 
- 32bit 마지막 숫자가 1 인지 0 인지 확인 한뒤에 
- 1 일시에 `res` 값에 +1 해줌. 
- `res` 값을 `shift operator` 를 사용하여 왼쪽으로 한칸씩 총 32번 옮겨야함.
- unsigned 니까 31 bit 까지 위 1일시에 +1 해주는 조건문을 적용시킴

> 결과 

```swift 
func reverseBits(_ n: Int) -> Int {
  
  var n = n
  var result = 0
  //주어진 값 마지막부터 1 인지 0인지 확인하고, 1이면 result 에 1bit 를 마지막 자리수에 추가 해줌.
  //이 과정을 n 이 0 이 될때까지 진행.
  for i in 0..<32 {
    result += (n & 1) // (n 의 마지막 자리가 0 인지 1 인지 알기 위해서 & operator 를 사용)
    n >>= 1 // n 을 / 2 해줌
    if i < 31 { //31번 해주는데.... unsigned 라 그런듯.
      result <<= 1 // 오른쪽 shift 해줌 (result 값 * 2).
    }
  }
  return result
}
```

- Time complexity: `O(1)`
  
- Space complexity: `O(1)`

 </details>
 
 <details> 
   <summary> 4.0 Pascal's Triangle </summary> 
   
   > 고민 
   - Brute Force 방법 이외에 구현할수 있는 방법은 없을까? 
   
   > 해결 
   - 시도1 : Brute Force
      - 2중 for loop 을 돌면서 레벨 하나씩 채워줌 
      
      ```swift 
      func generate(_ numRows: Int) -> [[Int]] {

         var res: [[Int]] = []

         for row in 0..<numRows {
           var rows: [Int] = []
           for i in 0...row {
             if i == 0 || i == row {
               rows.append(1)
             }else {
               rows.append(res[row-1][i-1] + res[row-1][i])
             }
           }
           res.append(rows)
         }
         return res
       }
     ```
    
   - Time complexity: `O(n^2)`
  
   - Space complexity: `O(n)`

 </details> 
 
 <details>
  <summary> 5.0 Valid Parentheses </summary>

  > 고민 
  - 어떻게 짝을 맞춰야하나 고민했는데, 요소 순서대로 하나하나 검사하는 방법은 실패했다.
  - 힌트를 찾아 봤더니 Stack 을 사용해서 문제를 풀을수 있을것 같았다.
  
  > 해결 
  - 딕셔너리 형태로 닫힌 bracket 을 key, 열린 bracket 을 value 로 할당해논다. 
  - 주어진 `s` 를 순회하면서 만약 요소가 닫힌 것이라면, 그에 맞는 열린 bracket 을 딕셔너리를 이용해서 찾는다. 
  - stack 의 맨위에 있는 요소를 불러와 딕셔너리에서 찾은 열린 bracket 과 같은 요소인지 확인한다. (틀릴시 false 반환) 
  - 만약 딕셔너리에 맞지 않은 요소라면, 열린 요소이기때문에 stack 에 `append` 해준다. 
  - 마지막으로 stack 이 비어 있지 않다면 짝이 맞지 않는 `s` 이기 때문에 false 를 반환해준다. 
  
  > 결과 
  ```swift 
  func isValidParentheses(_ s: String) -> Bool {
  let brackets: [String:String] = [")":"(","]":"[","}":"{" ] //closed: open
  var stack: [String] = []
  
  for char in s {
    if let matchedBracket = brackets[String(char)], let lastString = stack.popLast() {
      if lastString != matchedBracket {
        return false
      }
      continue
    }
    stack.append(String(char))
  }
  return stack.isEmpty
} 
  ```
  - Time complexity: `O(n)`
  
  - Space complexity: `O(n)`
  
 </details> 
 
 <details> 
   <summary> 6.0 Missing Number </summary>
   
   > 해결
   - (배열 크기 + 1) = (0 부터 최대수 까지의 크기) 의 합을 주어진 배열의 합과 빼서 나머지 수를 반환 
   
   ```swift 
   func missingNumber(_ nums: [Int]) -> Int {
        var sum = nums.reduce(0,+)
        var expectedSum = Array(0...nums.count).reduce(0,+)
        return expectedSum - sum
    }
   ```
   
   - Time complexity: `O(n)`
  
   - Space complexity: `O(1)`
 </details>
 
