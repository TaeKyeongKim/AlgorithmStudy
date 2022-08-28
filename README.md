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

        
</details>
