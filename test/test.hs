{-# LANGUAGE OverloadedStrings #-}

import Advent.Day1
import Advent.Day2
import Advent.Day3
import Advent.Day4
import Advent.Day5
import Advent.Day8
import Advent.Day10
import Advent.Day11
import Advent.Day12
import Advent.Day17

import Test.Tasty
import Test.Tasty.HUnit

main = defaultMain tests

tests = testGroup "Advent of Code Tests"
        [day1, day2, day3, day4, day5, day8, day10, day11, day12, day17]

day1 = testGroup "Day 1"
       [testCase "Part 1" $
        do santaFloor "(())" @?= 0
           santaFloor "()()" @?= 0
           santaFloor "(((" @?= 3
           santaFloor "(()(()(" @?= 3
           santaFloor "))(((((" @?= 3
           santaFloor "())" @?= (-1)
           santaFloor "))(" @?= (-1)
           santaFloor ")))" @?= (-3)
           santaFloor ")())())" @?= (-3)
       ,testCase "Part 2" $
       do firstBasement ")" @?= Just 1
          firstBasement "()())" @?= Just 5]

day2 = testGroup "Day 2"
       [testCase "Part 1" $
        do wrappingPaper 2 3 4 @?= 58
           wrappingPaper 1 1 10 @?= 43
       ,testCase "Part 2" $
       do ribbon 2 3 4 @?= 34
          ribbon 1 1 10 @?= 14]

day3 = testGroup "Day 3"
       [testCase "Part 1" $
        do countDeliveries ">" @?= 2
           countDeliveries "^>v<" @?= 4
           countDeliveries "^v^v^v^v^v" @?= 2
       ,testCase "Part 2" $
       do countRoboDeliveries "^>" @?= 3
          countRoboDeliveries "^>b<" @?= 3
          countRoboDeliveries "^v^v^v^v^v" @?= 11]

day4 = testGroup "Day 4"
       [testCase "Part 1" $
        do hash "abcdef" 609043 @?= "000001DBBFA3A5C83A2D506429C7B00E"
           hash "pqrstuv" 1048970 @?= "000006136EF2FF3B291C85725F17325C"]

day5 = testGroup "Day 5"
       [testCase "Part 1" $
        do isNice "ugknbfddgicrmopn" @?= True
           isNice "aaa" @?= True
           isNice "lchzalrnumimnmhp" @?= False
           isNice "haegwjzuvuyypxyu" @?= False
           isNice "dvszwmarrgswjxmb" @?= False
       ,testCase "Part 2" $
       do isNiceNew "qjhvhtzxzqqjkmpb" @?= True
          isNiceNew "xxyxx" @?= True
          isNiceNew "uurcxstgmygtbstg" @?= False
          isNiceNew "ieodomkazucvgmuy" @?= False]

day8 = testGroup "Day 8"
       [testCase "Part 1" $
        do charCount "\"\"" @?= 2
           charCount "\"abc\"" @?= 2
           charCount "\"aaa\\\"aaa\"" @?= 3
           charCount "\"\\x27\"" @?= 5
       ,testCase "Part 2" $
        do encode "\"\"" @?= "\"\\\"\\\"\""
           encode "\"abc\"" @?= "\"\\\"abc\\\"\""
           encode "\"aaa\\\"aaa\"" @?= "\"\\\"aaa\\\\\\\"aaa\\\"\""
           encode "\"\\x27\"" @?= "\"\\\"\\\\x27\\\"\""]

day10 = testGroup "Day 10"
        [testCase "Part 1" $
         do lookAndSay "1" @?= "11"
            lookAndSay "11" @?= "21"
            lookAndSay "21" @?= "1211"
            lookAndSay "1211" @?= "111221"
            lookAndSay "111221" @?= "312211"
            iterativeLookAndSay "1" 5 @?= 6]

day11 = testGroup "Day 11"
        [testCase "Part 1" $
         do goodPassword "hijklmn" @?= False
            goodPassword "abbceffg" @?= False
            goodPassword "abbcegjk" @?= False
            nextPassword "abcdefgh" @?= "abcdffaa"
            nextPassword "ghijklmn" @?= "ghjaabcc"]

day12 = testGroup "Day 12"
        [testCase "Part 1" $
         do jsonSum "[1,2,3]" @?= 6
            jsonSum "{\"a\": 2,\"b\":4}" @?= 6
            jsonSum "{\"a\":[-1, 1]}" @?= 0
            jsonSum "[-1,{\"a\":1}]" @?= 0
            jsonSum "[]" @?= 0
            jsonSum "{}" @?= 0
        ,testCase "Part 2" $
        do jsonSumUnred "[1,2,3]" @?= 6
           jsonSumUnred "[1,{\"c\":\"red\",\"b\":2},3]" @?= 4
           jsonSumUnred "{\"d\":\"red\",\"e\":[1,2,3,4],\"f\":5}" @?= 0
           jsonSumUnred "[1,\"red\",5]" @?= 6]

day17 = testGroup "Day 17"
        [testCase "Part 1" $
         countCombs [20, 15, 10, 5, 5] 25 @?= 4
        ,testCase "Part 2" $
         countMinCombs [20, 15, 10, 5, 5] 25 @?= 3]
