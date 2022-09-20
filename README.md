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
