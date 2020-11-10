# <img align="left" width="100px" src="https://user-images.githubusercontent.com/60619133/98633670-e2d21100-2347-11eb-813a-3abd4478bf1d.png" />Love Meter

<p align="center">
   <a href="https://github.com/Mufaddal5253110">
    <img src="https://img.shields.io/badge/Github-Mufaddal Shakir-black.svg?style=for-the-badge">
  </a>
  <a href="https://github.com/Mufaddal5253110/reflectly-like-loginpage-flutter/stargazers">
    <img src="https://img.shields.io/github/stars/Mufaddal5253110/Love_Meter.svg?style=for-the-badge">
  </a>
   <a href="https://rb.gy/r4yzzi">
    <img src="https://img.shields.io/badge/YouTube-ANDROREALM-red.svg?style=for-the-badge">
  </a>
     <a href="https://www.instagram.com/dshakir52/">
    <img src="https://img.shields.io/badge/Instagram-dshakir52-purple.svg?style=for-the-badge">
  </a>
 
</p>

## Screen Shots
|<img src="https://user-images.githubusercontent.com/60619133/98633824-3a707c80-2348-11eb-8142-3d80d25867f5.jpg" alt="feed example" width = "220">|<img src="https://user-images.githubusercontent.com/60619133/98633822-36dcf580-2348-11eb-8e33-a1687a390cc5.jpg" alt="feed example" width = "220">|


## Algorithm
In order for the algorithm to work it combines two names and the word "loves". For this example we will use names "Mufaddal" and "Shakir" so the combined text for the calculation is "Mufaddal Loves Shakir"
1. Count all the letters from left to right and write down the number
   * First one is "M" and it appears once, so we write down 1
   * Next is "U" and it also appears once, write down 1
   * Don’t repeat letters (on paper strike the ones you have counted) and continue to the end
   * You should get (1, 1, 1, 3, 2, 2, 1, 1, 1, 2, 1, 1, 1, 1)
2. The second part is getting the shorter version of the number
   * You do this by adding the leftmost and rightmost numbers together
   * The first pair is 1 + 1 and write down the sum of the two numbers (in our case 2), next 1 + 1, 1 + 1…, continue this till you reach the middle, if there is only one number left, write it down, otherwise sum both numbers
      * Again you should strike the numbers you add together (one from the left and one from the right)
   * You should get [2, 2, 2, 4, 4, 3, 2]
3. Next step is repeating step 3 until you get only two numbers
   * For our example, this is two more times
   * So you should get [4, 5, 6, 4] for the first iteration
   * And the result should be 82
      * The result should always have two numbers (except 100)
4. The result is 82%

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

