# AlgorithmStudy

### 1.0 LeetCode [#9](https://leetcode.com/problems/palindrome-number/): Palindrome
<details>
<summary> 고민 과 해결</summary>
- 어떻게 x 의 integer 값을 뒤집을까?
 
    1.0: x 값을 10 으로 나눈 나머지 값, 첫째 (1의) 자리 값을 저장한다. 
    
    2.0: 10 으로 x 값을 나눈다 
    
    3.0: x 가 0 이 될때까지 1,2 번 프로세스를 반복한다. 
    
- x 가 음수일때는 어떻게 처리할까?
    - 음수일경우 어느조합이 오든 Palindrome(회문) 조건이 성립하지 않음으로 false 를 반환하게 처리.
    
</details>
